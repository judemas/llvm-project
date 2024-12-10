// SeminalInputPass.cpp

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/OptimizationLevel.h"
#include "llvm/Analysis/CFG.h"
#include <iostream>
#include "llvm/IR/Module.h"

#include <set>
#include <map>
#include <queue>
#include <string>

using namespace llvm;

class SeminalInputPass : public PassInfoMixin<SeminalInputPass> {
public:
    // Store input variables detected from I/O functions
    std::map<Value*, unsigned> inputVariables;
    // Map of key points to input dependencies
    std::map<Instruction *, std::set<Value *>> keyPointDependencies;
    std::map<AllocaInst*, unsigned> declaredVariables;
    std::map<Instruction*, bool> keyPointGetcFound;

    // Key point ID counters and dictionary
    unsigned branchCounter = 1;
    unsigned funcPtrCounter = 1;
    std::map<Instruction*, std::string> keyPointIDs; // Map from key point to ID
    // For demonstration, store dictionary info: ID -> {file, line, targetLine}
    struct KeyPointInfo {
        std::string file;
        unsigned line;
        unsigned targetLine; // simplistic assumption
    };
    std::map<std::string, KeyPointInfo> keyPointDict;

    // Track file pointers from fopen
    std::set<Value*> filePointers; // If we detect fopen returning FILE*, store it
    // If loops depend on getc(fp), we might say "size of file fp" is input feature

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
        inputVariables.clear();
        keyPointDependencies.clear();
        declaredVariables.clear();
        filePointers.clear();
        keyPointIDs.clear();
        keyPointDict.clear();
        branchCounter = 1;
        funcPtrCounter = 1;




        detectInputVariables(F);
        detectKeyPoints(F);
        analyzeInputInfluence(F);
        printResults(F);

        return PreservedAnalyses::all();
    }

    void detectInputVariables(Function &F) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                if (CallInst *call = dyn_cast<CallInst>(&Inst)) {
                    Function *calledFunc = call->getCalledFunction();
                    if (!calledFunc) {
                        continue;
                    }
                    StringRef funcName = calledFunc->getName();
                    if (isInputFunction(funcName)) {
                        for (unsigned i = 0; i < call->arg_size(); ++i) {
                            Value *arg = call->getArgOperand(i);
                            if (funcName == "scanf" && i == 0)
                                continue; // Skip format string
                            Value *var = stripCasts(arg);

                            // Check if 'var' is a stack-allocated AllocaInst
                            AllocaInst *AllocaVar = getAllocaInst(var);
                            if (!AllocaVar) {
                                AllocaVar = dyn_cast<AllocaInst>(var);
                            }

                            if (AllocaVar) {
                                unsigned declLine = 0;
                                auto it = declaredVariables.find(AllocaVar);
                                if (it != declaredVariables.end()) {
                                    declLine = it->second;
                                }
                                if (declLine == 0) {
                                    declLine = call->getDebugLoc() ? call->getDebugLoc()->getLine() : 0;
                                }
                                inputVariables[AllocaVar] = declLine;
                            }

                            // Additionally, check if 'var' is a GlobalVariable
                            if (GlobalVariable *GV = dyn_cast<GlobalVariable>(var)) {
                                unsigned callLine = call->getDebugLoc() ? call->getDebugLoc()->getLine() : 0;

                                // Assign the line number of the input function call to the global variable
                                inputVariables[GV] = callLine;
                            }
                        }
                    } else if (funcName == "fopen") {
                        bool foundAllocaForFp = false; // Declare here

                        if (!call->use_empty()) {
                            for (User *U : call->users()) {
                                if (StoreInst *SI = dyn_cast<StoreInst>(U)) {
                                    Value *storedValue = SI->getPointerOperand();
                                    if (AllocaInst *fpAlloca = getAllocaInst(storedValue)) {
                                        unsigned declLine = call->getDebugLoc() ? call->getDebugLoc()->getLine() : 0;
                                        inputVariables[fpAlloca] = declLine;
                                        filePointers.insert(fpAlloca);
                                        foundAllocaForFp = true; // Mark as found
                                        break;
                                    }
                                } else if (BitCastInst *BCI = dyn_cast<BitCastInst>(U)) {
                                    AllocaInst *fpAlloca = getAllocaInst(BCI);
                                    if (fpAlloca) {
                                        unsigned declLine = call->getDebugLoc() ? call->getDebugLoc()->getLine() : 0;
                                        inputVariables[fpAlloca] = declLine;
                                        filePointers.insert(fpAlloca);
                                        foundAllocaForFp = true; // Mark as found
                                        break;
                                    }
                                }
                            }
                        }

                        if (!foundAllocaForFp) {
                            // Handle global variables returned by fopen
                            for (GlobalVariable &GV : F.getParent()->globals()) {
                                if (GV.getName() == "fp") { // Assuming 'fp' is the global FILE* variable
                                    unsigned declLine = call->getDebugLoc() ? call->getDebugLoc()->getLine() : 0;
                                    inputVariables[&GV] = declLine;
                                    filePointers.insert(&GV);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    

    

    bool isInputFunction(StringRef funcName) {
        return funcName == "scanf" || funcName == "fgetc" || funcName == "fopen" || funcName == "getc"||
               funcName == "fread" || funcName == "fgets" || funcName == "fscanf" || 
               funcName == "sscanf" || funcName == "realloc";
    }

    void detectKeyPoints(Function &F) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                if (isKeyPoint(&Inst)) {
                    // Assign an ID
                    std::string id;
                    keyPointDependencies[&Inst] = std::set<Value *>();
                    keyPointGetcFound[&Inst] = false;
                    if (BranchInst *br = dyn_cast<BranchInst>(&Inst)) {
                        if (br->isConditional()) {
                            id = "br_" + std::to_string(branchCounter++);
                            // record line info
                            unsigned line = getLineNumber(br);
                            KeyPointInfo kpi;
                            kpi.file = getSourceFileName(br);
                            kpi.line = line;
                            kpi.targetLine = 0; // just a placeholder
                            keyPointDict[id] = kpi;
                            keyPointIDs[&Inst] = id;
                        }
                    } else if (CallInst *call = dyn_cast<CallInst>(&Inst)) {
                        if (!call->getCalledFunction()) {
                            // Indirect call
                            id = "func_" + std::to_string(funcPtrCounter++);
                            unsigned line = getLineNumber(call);
                            KeyPointInfo kpi;
                            kpi.file = getSourceFileName(call);
                            kpi.line = line;
                            kpi.targetLine = 0;
                            keyPointDict[id] = kpi;
                            keyPointIDs[&Inst] = id;
                        }
                    } else {
                        // Other key points if any
                    }

                    keyPointDependencies[&Inst] = std::set<Value *>();
                }
            }
        }
    }

    void analyzeInputInfluence(Function &F) {
        for (auto &entry : keyPointDependencies) {
            Instruction *keyPoint = entry.first;
            std::set<Value *> &dependencies = entry.second;

            std::set<Instruction *> visited;
            std::queue<Instruction *> worklist;
            worklist.push(keyPoint);

            while (!worklist.empty()) {
                Instruction *currentInst = worklist.front();
                worklist.pop();

                if (!visited.insert(currentInst).second)
                    continue;

                // Check if currentInst is a call to getc/fgetc
                if (CallInst *ci = dyn_cast<CallInst>(currentInst)) {
                    if (Function *cf = ci->getCalledFunction()) {
                        StringRef fnName = cf->getName();
                        if (fnName == "getc" || fnName == "fgetc") {
                            keyPointGetcFound[keyPoint] = true;
                            
                            // Iterate over all arguments of the getc/fgetc call
                            for (auto &arg : ci->args()) {
                                Value *actualArg = arg;

                                // If the argument is a LoadInst, retrieve the pointer operand
                                if (LoadInst *LI = dyn_cast<LoadInst>(arg)) {
                                    actualArg = LI->getPointerOperand();
                                }

                                // Check if the actualArg (likely the AllocaInst) is in filePointers
                                if (filePointers.count(actualArg)) {
                                    dependencies.insert(actualArg);
                                }
                            }
                        }
                    }
                }

                // Traverse operands to find dependencies
                for (Use &U : currentInst->operands()) {
                    Value *operand = U.get();

                    // If the operand is an input variable, add it as a dependency
                    if (inputVariables.count(operand)) {
                        dependencies.insert(operand);
                        continue;
                    }

                    // If the operand is an Instruction, add it to the worklist for further analysis
                    if (Instruction *operandInst = dyn_cast<Instruction>(operand)) {
                        worklist.push(operandInst);
                    }
                }
            }
        }
    }

    bool isKeyPoint(Instruction *Inst) {
        if (BranchInst *br = dyn_cast<BranchInst>(Inst)) {
            // A branch instruction can be part of a loop condition or an if-else.
            // If it's conditional, we consider it a key point.
            return br->isConditional();
        }

        if (SwitchInst *si = dyn_cast<SwitchInst>(Inst)) {
            // Switch instructions also represent branching points.
            return true;
        }

        if (CallInst *call = dyn_cast<CallInst>(Inst)) {
            // Indirect calls (function pointers) are also key points.
            return (!call->getCalledFunction());
        }

        return false;
    }

    void printResults(Function &F) {
        errs() << "\nSeminal Input Features for function: " << F.getName() << "\n";
        for (const auto &entry : keyPointDependencies) {
            Instruction *keyPoint = entry.first;
            const auto &dependencies = entry.second;

            if (dependencies.empty())
                continue;

            unsigned line = getLineNumber(keyPoint);
            errs() << "  Key Point at line " << line << " depends on:\n";
            for (Value *dep : dependencies) {
                unsigned depLine = getLineNumber(dep);
                std::string varName = getVariableName(dep);
                errs() << "    - " << varName << " (line " << depLine << ")\n";
            }
        }
    }

    Value *stripCasts(Value *V) {
        while (true) {
            if (BitCastInst *BCI = dyn_cast<BitCastInst>(V)) {
                V = BCI->getOperand(0);
            } else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(V)) {
                V = GEP->getPointerOperand();
            } else {
                break;
            }
        }
        return V;
    }

    unsigned getLineNumber(Value *V) {
        if (AllocaInst *AI = dyn_cast<AllocaInst>(V)) {
            auto it = inputVariables.find(AI);
            if (it != inputVariables.end()) {
                return it->second; // Return the initialization line
            }
        }

        if (GlobalVariable *GV = dyn_cast<GlobalVariable>(V)) {
            auto it = inputVariables.find(GV);
            if (it != inputVariables.end()) {
                return it->second;
            }
        }

        if (Instruction *Inst = dyn_cast<Instruction>(V)) {
            if (DILocation *Loc = Inst->getDebugLoc()) {
                return Loc->getLine();
            }
        }
        
        return 0; // Default to 0 if no line information is found
    }

    std::string getSourceFileName(Instruction *I) {
        if (DILocation *Loc = I->getDebugLoc()) {
            if (auto *Scope = Loc->getScope()) {
                if (auto *File = Scope->getFile()) {
                    return File->getFilename().str();
                }
            }
        }
        return "[unknown_file]";
    }

    DILocalVariable* findDILocalVariable(Value *V) {
        if (AllocaInst *AI = dyn_cast<AllocaInst>(V)) {
            for (User *U : AI->users()) {
                if (DbgDeclareInst *DDI = dyn_cast<DbgDeclareInst>(U)) {
                    errs() << "Found DbgDeclareInst for AllocaInst: " << *DDI << "\n";
                    DILocalVariable *Var = DDI->getVariable();
                    if (Var) {
                        errs() << "DILocalVariable: " << Var->getName() << ", Line: " << Var->getLine() << "\n";
                    } else {
                        errs() << "DILocalVariable is null.\n";
                    }
                    return Var;
                } else {
                    errs() << "User is not a DbgDeclareInst: " << *U << "\n";
                }
            }
        }

        if (Instruction *Inst = dyn_cast<Instruction>(V)) {
            if (MDNode *VarMD = Inst->getMetadata("dbg")) {
                if (auto *DILV = dyn_cast<DILocalVariable>(VarMD)) {
                    errs() << "Found DILocalVariable via metadata: " << DILV->getName() << ", Line: " << DILV->getLine() << "\n";
                    return DILV;
                }
            }
        }

        for (User *U : V->users()) {
            if (DILocalVariable *Var = findDILocalVariable(U)) {
                return Var;
            }
        }

        errs() << "No DILocalVariable found for Value: " << *V << "\n";
        return nullptr;
    }

    std::string getVariableName(Value *V) {
        if (V->hasName()) {
            return V->getName().str();
        }

        if (AllocaInst *AI = dyn_cast<AllocaInst>(V)) {
            // Attempt to get the variable name from debug info
            for (User *U : AI->users()) {
                if (DbgVariableIntrinsic *DVI = dyn_cast<DbgVariableIntrinsic>(U)) {
                    DILocalVariable *Var = DVI->getVariable();
                    if (Var) {
                        return Var->getName().str();
                    }
                }
            }

            // If no debug variable found and this Alloca is known to be a file pointer input
            if (filePointers.count(AI)) {
                return "fp"; // fallback name
            }
        }

        // Handle GlobalVariable
        if (GlobalVariable *GV = dyn_cast<GlobalVariable>(V)) {
            if (GV->hasName()) {
                return GV->getName().str();
            }
            return "[global_variable]";
        }

        return "[unknown]";
    }

    AllocaInst* getAllocaInst(Value *V) {
        std::set<Value *> Visited;
        while (V && Visited.insert(V).second) {
            if (AllocaInst *AI = dyn_cast<AllocaInst>(V)) {
                return AI;
            } else if (BitCastInst *BCI = dyn_cast<BitCastInst>(V)) {
                V = BCI->getOperand(0);
            } else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(V)) {
                V = GEP->getPointerOperand();
            } else if (LoadInst *LI = dyn_cast<LoadInst>(V)) {
                V = LI->getPointerOperand();
            } else if (StoreInst *SI = dyn_cast<StoreInst>(V)) {
                V = SI->getPointerOperand();
            } else {
                break;
            }
        }
        return nullptr;
    }

    
}; // End of class SeminalInputPass

// New pass manager registration
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION, "SeminalInputPass", LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "seminal-input-pass") {
                        FunctionPassManager FPM;
                        FPM.addPass(SeminalInputPass());
                        MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
                        return true;
                    }
                    return false;
                });
        }
    };
}
