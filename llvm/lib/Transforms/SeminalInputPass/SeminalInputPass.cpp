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

#include <set>
#include <map>
#include <queue>

using namespace llvm;

class SeminalInputPass : public PassInfoMixin<SeminalInputPass> {
public:
    // Store input variables detected from I/O functions
    std::set<Value *> inputVariables;
    // Map of key points to input dependencies
    std::map<Instruction *, std::set<Value *>> keyPointDependencies;

    // Run the pass on each function
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
        // Reset per-function data structures
        inputVariables.clear();
        keyPointDependencies.clear();

        // Perform the analysis
        detectInputVariables(F);
        detectKeyPoints(F);
        analyzeInputInfluence(F);
        printResults(F);

        return PreservedAnalyses::all();
    }

    // Step 1: Detect input variables from functions like scanf, getc, fread, etc.
   void detectInputVariables(Function &F) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                // Detect calls to input functions
                if (CallInst *call = dyn_cast<CallInst>(&Inst)) {
                    Function *calledFunc = call->getCalledFunction();
                    if (calledFunc) {
                        StringRef funcName = calledFunc->getName();
                        if (isInputFunction(funcName)) {
                            // Handle different input functions
                            for (unsigned i = 0; i < call->arg_size(); ++i) {
                                Value *arg = call->getArgOperand(i);
                                // For functions like scanf, arguments after format string are inputs
                                if (funcName == "scanf" && i == 0)
                                    continue; // Skip format string
                                Value *var = stripCasts(arg);
                                inputVariables.insert(var);
                                printValueLocation(var, "Detected input variable");
                            }
                        }
                    }
                }
            }
        }
    }


    // Helper to check if a function is an input function
    bool isInputFunction(StringRef funcName) {
        return funcName == "scanf" || funcName == "getc" || funcName == "fgetc" ||
               funcName == "fread" || funcName == "fgets" || funcName == "fscanf";
    }

    // Step 2: Detect key points (conditional branches and function pointer calls)
    void detectKeyPoints(Function &F) {
        for (auto &BB : F) {
            for (auto &Inst : BB) {
                if (isKeyPoint(&Inst)) {
                    // Initialize empty dependencies; we'll fill them later
                    keyPointDependencies[&Inst] = std::set<Value *>();
                }
            }
        }
    }

    // Step 3: Analyze the influence of input variables on key points
    void analyzeInputInfluence(Function &F) {
        for (auto &entry : keyPointDependencies) {
            Instruction *keyPoint = entry.first;
            std::set<Value *> &dependencies = entry.second;

            // Perform backward traversal to find dependencies
            std::set<Instruction *> visited;
            std::queue<Instruction *> worklist;
            worklist.push(keyPoint);

            while (!worklist.empty()) {
                Instruction *currentInst = worklist.front();
                worklist.pop();

                if (!visited.insert(currentInst).second)
                    continue; // Already visited

                for (Use &U : currentInst->operands()) {
                    Value *operand = U.get();

                    if (inputVariables.count(operand)) {
                        dependencies.insert(operand);
                        continue;
                    }

                    if (Instruction *operandInst = dyn_cast<Instruction>(operand)) {
                        worklist.push(operandInst);
                    }
                }
            }
        }
    }

    // Utility function to check if a given instruction is a key point.
    bool isKeyPoint(Instruction *Inst) {
        // Conditional branches
        if (BranchInst *br = dyn_cast<BranchInst>(Inst)) {
            if (br->isConditional())
                return true;
        }
        // Function pointer calls
        if (CallInst *call = dyn_cast<CallInst>(Inst)) {
            if (!call->getCalledFunction()) // Indirect call (possibly via function pointer)
                return true;
        }
        return false;
    }

    // Print the results of the pass
    void printResults(Function &F) {
        errs() << "\nSeminal Input Features for function: " << F.getName() << "\n";
        for (const auto &entry : keyPointDependencies) {
            Instruction *keyPoint = entry.first;
            unsigned line = getLineNumber(keyPoint);

            errs() << "Line " << line << ": Key Point Instruction\n";
            errs() << "  Depends on input variables:\n";
            for (Value *dep : entry.second) {
                unsigned depLine = getLineNumber(dep);
                std::string varName = getVariableName(dep);
                errs() << "    - Line " << depLine << ": " << varName << "\n";
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


    // Helper function to get the source line number of an instruction
unsigned getLineNumber(Value *V) {
    if (Instruction *Inst = dyn_cast<Instruction>(V)) {
        // Check if the instruction has a debug location
        if (DILocation *Loc = Inst->getDebugLoc()) {
            return Loc->getLine();
        }

        // If it's an AllocaInst, check for associated debug info
        if (AllocaInst *Alloca = dyn_cast<AllocaInst>(Inst)) {
            // Iterate over users to find DbgDeclareInst or DbgValueInst
            for (User *U : Alloca->users()) {
                if (DbgDeclareInst *DDI = dyn_cast<DbgDeclareInst>(U)) {
                    DILocalVariable *Var = DDI->getVariable();
                    return Var->getLine();
                } else if (DbgValueInst *DVI = dyn_cast<DbgValueInst>(U)) {
                    DILocalVariable *Var = DVI->getVariable();
                    return Var->getLine();
                }
            }
        }
    }

    return 0;
}



    // Helper function to get the variable name
    std::string getVariableName(Value *V) {
        if (V->hasName()) {
            return V->getName().str();
        }

        if (AllocaInst *Alloca = dyn_cast<AllocaInst>(V)) {
            // Iterate over users to find DbgDeclareInst or DbgValueInst
            for (User *U : Alloca->users()) {
                if (DbgDeclareInst *DDI = dyn_cast<DbgDeclareInst>(U)) {
                    DILocalVariable *Var = DDI->getVariable();
                    return Var->getName().str();
                } else if (DbgValueInst *DVI = dyn_cast<DbgValueInst>(U)) {
                    DILocalVariable *Var = DVI->getVariable();
                    return Var->getName().str();
                }
            }
        }

        return "[unknown]";
    }




    // Helper to print value location
    void printValueLocation(Value *V, StringRef prefix) {
        unsigned line = getLineNumber(V);
        std::string varName = getVariableName(V);
        errs() << prefix << " at line " << line << ": " << varName << "\n";
    }
};

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
