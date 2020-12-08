//
//  File.swift
//  
//
//  Created by Andy Best on 08/12/2020.
//

import Foundation

func doDay8_part1() -> Int {
    let input = getFileInput(fromResourceWithName: "input_day8", andExtension: "txt")
    let vm = VM(source: input)
    return vm.runUntilLoop()
}

func doDay8_part2() -> Int {
    let input = getFileInput(fromResourceWithName: "input_day8", andExtension: "txt")
    let vm = VM(source: input)
    return vm.runUntilDoneAndPatch()
}
