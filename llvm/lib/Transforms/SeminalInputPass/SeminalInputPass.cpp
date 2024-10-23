// SeminalInputPass.cpp
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <map>

using namespace llvm;

namespace {
    struct SeminalInputPass : public FunctionPass {
        static char ID;
        // Store input variables detected from scanf or similar functions
        std::set<Value *> inputVariables;
        // Map of key points (provided externally or identified separately) to input dependencies
        std::map<Instruction *, std::set<Value *>> keyPointDependencies;

        SeminalInputPass() : FunctionPass(ID) {}

        // Run the pass on each function
        bool runOnFunction(Function &F) override {
            errs() << "Analyzing function: " << F.getName() << "\n";
            inputVariables.clear();
            keyPointDependencies.clear();

            // Step 1: Identify input variables (e.g., from scanf)
            detectInputVariables(F);

            // Step 2: Analyze the influence of input variables on pre-determined key points
            analyzeInputInfluence(F);

            // Step 3: Print out the results
            printResults(F);

            return false; // This pass does not modify the program's code
        }

        // Step 1: Detect input variables from functions like scanf
        void detectInputVariables(Function &F) {
            for (auto &BB : F) {
                for (auto &Inst : BB) {
                    // Detect calls to input functions like scanf
                    if (CallInst *call = dyn_cast<CallInst>(&Inst)) {
                        Function *calledFunc = call->getCalledFunction();
                        if (calledFunc && calledFunc->getName() == "scanf") {
                            // Assume the input is stored in the arguments of scanf
                            for (unsigned i = 1; i < call->getNumOperands(); ++i) {
                                Value *arg = call->getOperand(i);
                                inputVariables.insert(arg);
                                errs() << "Detected input variable from scanf: " << *arg << "\n";
                            }
                        }
                    }
                }
            }
        }

        // Step 2: Analyze input influence on pre-determined key points
        // This function assumes that the key points have already been identified.
        void analyzeInputInfluence(Function &F) {
            for (auto &BB : F) {
                for (auto &Inst : BB) {
                    // Here, we assume that the key points (e.g., branches or loop conditions)
                    // are identified elsewhere and stored in keyPointDependencies.
                    if (isKeyPoint(&Inst)) {
                        std::set<Value *> influencingInputs;
                        for (Value *inputVar : inputVariables) {
                            if (isDependentOn(&Inst, inputVar)) {
                                influencingInputs.insert(inputVar);
                            }
                        }
                        keyPointDependencies[&Inst] = influencingInputs;
                    }
                }
            }
        }

        // Utility function to check if a given instruction is a key point.
        bool isKeyPoint(Instruction *Inst) {
            // This function should return true if the instruction is a key point.
            // This is a placeholder or an external call for now.
            return isa<BranchInst>(Inst) || isa<CallInst>(Inst);
        }

        // Utility function to check if a value depends on an input variable
        bool isDependentOn(Instruction *Inst, Value *inputVar) {
            // Simplified dependency check using def-use chains.
            for (auto *user : inputVar->users()) {
                if (user == Inst) {
                    return true;
                }
                if (Instruction *userInst = dyn_cast<Instruction>(user)) {
                    if (userInst->getParent() == Inst->getParent()) {
                        return true;
                    }
                }
            }
            return false;
        }

        // Get the source code line number for an instruction, if available
        unsigned getLineNumber(Instruction *Inst) {
            if (DILocation *Loc = Inst->getDebugLoc()) {
                return Loc->getLine();
            }
            return 0;
        }

        // Step 3: Print the results of the analysis
        void printResults(Function &F) {
            errs() << "=== Seminal Input Analysis Results for Function: " << F.getName() << " ===\n";
            for (auto &[inst, inputs] : keyPointDependencies) {
                unsigned line = getLineNumber(inst);
                if (!inputs.empty()) {
                    errs() << "Line " << line << ": Influenced by inputs: ";
                    for (auto *input : inputs) {
                        errs() << *input << " ";
                    }
                    errs() << "\n";
                }
            }
            errs() << "=============================================\n";
        }
    };
}

char SeminalInputPass::ID = 0;
static RegisterPass<SeminalInputPass> X("seminal-input-pass", "Seminal Input Feature Detection", false, false);