//
//  File.swift
//  
//
//  Created by Andy Best on 07/12/2020.
//

import Foundation
import XCTest

@testable import adventofcode2020

class Day4Tests: XCTestCase {
    func test_day4Input() {
        let testInput = """
        ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm

        iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929

        hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm

        hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in
        """

        let passports = getPassportInput(from: testInput)
        XCTAssertEqual(passports.count, 4)

        XCTAssertTrue(passportIsValid(passports[0]))
        XCTAssertFalse(passportIsValid(passports[1]))
        XCTAssertTrue(passportIsValid(passports[2]))
        XCTAssertFalse(passportIsValid(passports[3]))

        XCTAssertEqual(passports.filter { passportIsValid($0) }.count, 2)
    }

    func test_day4Part1() {
        XCTAssertEqual(doDay4_part1(), 237)
    }

    func test_day4Part2() {
        XCTAssertEqual(doDay4_part2(), 172)
    }
}
