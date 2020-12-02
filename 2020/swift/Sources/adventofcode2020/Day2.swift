//
//  File.swift
//  
//
//  Created by Andy Best on 02/12/2020.
//

import Foundation



struct PasswordInput {
    let requiredLetter: Character
    let rangeRequirement: Range<Int>
    let input: String

    var isValid: Bool {
        return rangeRequirement.contains((input.characterFrequencies[requiredLetter] ?? 0))
    }

    var isValidNewRules: Bool {
        let r1 = (input[input.index(input.startIndex, offsetBy: rangeRequirement.lowerBound - 1)] == requiredLetter)
        let r2 = (input[input.index(input.startIndex, offsetBy: rangeRequirement.upperBound - 2)] == requiredLetter)
        return (r1 != r2) && (r1 || r2)
    }
}

func getPasswordInput(fromResourceWithName name: String, andExtension fileExtension: String?) -> [PasswordInput] {
    guard let url = Bundle.module.url(forResource: name, withExtension: fileExtension),
          let data = try? Data(contentsOf: url),
          let str = String(data: data, encoding: .utf8) else {
        fatalError("Unable to get input data")
    }
    return getPasswordInput(from: str)
}

func getPasswordInput(from str: String) -> [PasswordInput] {
    return str.split(separator: "\n")
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .map { line in
            guard let match = line.match(#"([0-9]+)-([0-9]+)\s*([A-Za-z]):\s*(\w+)"#),
                  let letter = match[3].first,
                  let rangeStart = Int(match[1]),
                  let rangeEnd = Int(match[2]) else {
                fatalError("Unable to parse input")
            }

            return PasswordInput(requiredLetter: letter, rangeRequirement: rangeStart..<(rangeEnd + 1), input: match[4])
        }
}

func doDay2_part1() -> Int {
    let input = getPasswordInput(fromResourceWithName: "input_day2", andExtension: "txt")
    return input.map(\.isValid).filter { $0 }.count
}

func doDay2_part2() -> Int {
    let input = getPasswordInput(fromResourceWithName: "input_day2", andExtension: "txt")
    return input.map(\.isValidNewRules).filter { $0 }.count
}
