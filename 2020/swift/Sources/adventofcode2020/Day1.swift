//
//  File.swift
//  
//
//  Created by Andy Best on 01/12/2020.
//

import Foundation

func doDay1_part1() -> Int {
    let input = getIntInputArray(fromResourceWithName: "input_day1", andExtension: "txt")
    guard let result = findProduct(in: input, withSum: 2020, ofSize: 2) else {
        fatalError("Could not calculate result")
    }
    return result
}

func doDay1_part2() -> Int {
    let input = getIntInputArray(fromResourceWithName: "input_day1", andExtension: "txt")
    guard let result = findProduct(in: input, withSum: 2020, ofSize: 3) else {
        fatalError("Could not calculate result")
    }
    return result
}
