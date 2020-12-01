//
//  File.swift
//  
//
//  Created by Andy Best on 01/12/2020.
//

import Foundation

func uniqueCombinations<T>(of input: ArraySlice<T>, ofSize size: Int) -> [[T]] {
    if size == 0 {
        return [[]]
    }

    guard let first = input.first else { return [] }

    let head = [first]
    let subcombos = uniqueCombinations(of: input.dropFirst(), ofSize: size - 1)
    var result: [[T]] = subcombos.map { head + $0 }
    result += uniqueCombinations(of: input.dropFirst(), ofSize: size)
    return result
}

func uniqueCombinations<T>(of input: [T], ofSize size: Int) -> [[T]] {
    uniqueCombinations(of: ArraySlice(input), ofSize: size)
}


func findProduct(in input: [Int], withSum sum: Int, ofSize size: Int) -> Int? {
    uniqueCombinations(of: input, ofSize: size)
        .first(where: { $0.reduce(0, +) == sum })?
        .reduce(1, *)
}
