//
//  File.swift
//  
//
//  Created by Andy Best on 07/12/2020.
//

import Foundation

struct PassportField {
    let name: String
    let required: Bool
    var validator: (String) -> Bool

    func isPresent(in passport: [String: String]) -> Bool {
        return passport.keys.contains(name)
    }

    func isValid(for passport: [String: String], usingValidator: Bool = false) -> Bool {
        if !required { return true }
        if !isPresent(in: passport) { return false }
        if !usingValidator { return true }

        let isValid = validator(passport[name] ?? "")
        return isValid
    }
}

let PassportFields: [PassportField] = [
    PassportField(name: "byr", required: true) { input in
        guard let year = Int(input) else { return false }
        return year >= 1920 && year <= 2002
    },
    PassportField(name: "iyr", required: true) { input in
        guard let year = Int(input) else { return false }
        return year >= 2010 && year <= 2020
    },
    PassportField(name: "eyr", required: true) { input in
        guard let year = Int(input) else { return false }
        return year >= 2020 && year <= 2030
    },
    PassportField(name: "hgt", required: true) { input in
        if input.hasSuffix("in") {
            let value = input[input.startIndex...input.index(input.endIndex, offsetBy: -3)]
            guard let height = Int(value) else { return false }
            return height >= 59 && height <= 76
        } else if input.hasSuffix("cm") {
            let value = input[input.startIndex...input.index(input.endIndex, offsetBy: -3)]
            guard let height = Int(value) else { return false }
            return height >= 150 && height <= 193
        }

        return false
    },
    PassportField(name: "hcl", required: true) { input in
        return (input.match("#[0-9a-z]{6}")?.result.count ?? 0) > 0
    },
    PassportField(name: "ecl", required: true) { input in
        ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(input)
    },
    PassportField(name: "pid", required: true) { input in
        Int(input) != nil && input.count == 9
    },
    PassportField(name: "cid", required: false) { input in
        return true
    }
]

func passportIsValid(_ passport: [String: String], usingValidator: Bool = false) -> Bool {
    return PassportFields.allSatisfy { $0.isValid(for: passport, usingValidator: usingValidator) }
}

func doDay4_part1() -> Int {
    let passports = getPassportInput(fromResourceWithName: "input_day4", andExtension: "txt")
    return passports.filter { passportIsValid($0) }.count
}

func doDay4_part2() -> Int {
    let passports = getPassportInput(fromResourceWithName: "input_day4", andExtension: "txt")
    return passports.filter { passportIsValid($0, usingValidator: true) }.count
}
