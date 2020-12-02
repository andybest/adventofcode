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
    let lines = str.split(separator: "\n")
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

    let output: [PasswordInput] = lines.map { line in
        guard let regex = (try? NSRegularExpression(pattern: #"([0-9]+)-([0-9]+)\s*([A-Za-z]):\s*(\w+)"#)) else {
            fatalError("Could not create regular expression")
        }

        let range = NSRange(location: 0, length: line.count)
        let result: [NSTextCheckingResult] = regex.matches(in: line, options: [], range: range)

        let nsLine = line as NSString
        guard let rangeStart = Int(nsLine.substring(with: result[0].range(at: 1))),
              let rangeEnd = Int(nsLine.substring(with: result[0].range(at: 2))) else {
            fatalError("Invalid input")
        }

        guard let letter = nsLine.substring(with: result[0].range(at: 3)).first else {
            fatalError("Unable to extract letter requirement")
        }

        let input = nsLine.substring(with: result[0].range(at: 4)) as String
        let rangeRequirement = rangeStart..<(rangeEnd+1)

        return PasswordInput(requiredLetter: letter, rangeRequirement: rangeRequirement, input: input)
    }

    return output
}

func doDay2_part1() -> Int {
    let input = getPasswordInput(fromResourceWithName: "input_day2", andExtension: "txt")
    return input.map(\.isValid).filter { $0 }.count
}

func doDay2_part2() -> Int {
    let input = getPasswordInput(fromResourceWithName: "input_day2", andExtension: "txt")
    return input.map(\.isValidNewRules).filter { $0 }.count
}
