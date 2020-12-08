//
//  File.swift
//  
//
//  Created by Andy Best on 08/12/2020.
//

import Foundation

enum Instruction {
    case nop(Int)
    case acc(Int)
    case jmp(Int)

    init(asm: String) {
        let input = asm.split(separator: " ")
        guard input.count == 2,
              let operand = Int(input[1]) else {
            fatalError("Invalid input")
        }

        switch input[0] {
        case "nop": self = .nop(operand)
        case "acc": self = .acc(operand)
        case "jmp": self = .jmp(operand)
        default:
            fatalError("Unknown instruction \(input[0])")
        }
    }
}

struct ProcessorState {
    var pc: Int = 0
    var accumulator: Int = 0
    var instructionMemory: [Instruction] = []
    var visitedInstructions: Set<Int> = []
}

class VM {
    let memory: [Instruction]

    init(source: String) {
        memory = source.split(separator: "\n")
            .map { Instruction(asm: String($0)) }
    }

    func runInstruction(state: ProcessorState) -> ProcessorState {
        var state = state

        let currentInstruction = state.instructionMemory[state.pc]
        var pcInc = 1

        switch(currentInstruction) {
        case .nop: break
        case .acc(let operand): state.accumulator += operand
        case .jmp(let operand): pcInc = operand
        }

        state.pc += pcInc

        return state
    }

    func runUntilLoop() -> Int {
        var state = ProcessorState()
        state.instructionMemory = memory

        repeat {
            state.visitedInstructions.insert(state.pc)
            state = runInstruction(state: state)
        } while !state.visitedInstructions.contains(state.pc)

        return state.accumulator
    }

    func runUntilDoneAndPatch() -> Int {
        var state = ProcessorState()
        state.instructionMemory = memory

        var patchState: ProcessorState?

        repeat {
            if patchState == nil {
                // Attempt to patch instruction
                let currentInstruction = state.instructionMemory[state.pc]
                switch currentInstruction {
                case .nop(let operand):
                    patchState = state
                    state.instructionMemory[state.pc] = .jmp(operand)
                case .jmp(let operand):
                    patchState = state
                    state.instructionMemory[state.pc] = .nop(operand)
                default: break
                }
            } else if state.visitedInstructions.contains(state.pc) {
                // If the patch resulted in a loop, restore the state to before the patch
                guard let oldState = patchState else { fatalError("No patch state") }
                state = oldState
                patchState = nil
            }

            state.visitedInstructions.insert(state.pc)

            state = runInstruction(state: state)
        } while state.pc < state.instructionMemory.count

        return state.accumulator
    }

}
