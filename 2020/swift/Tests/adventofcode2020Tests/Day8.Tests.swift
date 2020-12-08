//
//  File.swift
//  
//
//  Created by Andy Best on 08/12/2020.
//

import Foundation
import XCTest

@testable import adventofcode2020

class Day8Tests: XCTestCase {
    func test_part1Example() {
        let input = """
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
        """

        let vm = VM(source: input)
        XCTAssertEqual(vm.runUntilLoop(), 5)
    }

    func test_part1() {
        let result = doDay8_part1()
        XCTAssertEqual(result, 1489)
    }

    func test_part2Example() {
        let input = """
        nop +0
        acc +1
        jmp +4
        acc +3
        jmp -3
        acc -99
        acc +1
        jmp -4
        acc +6
        """

        let vm = VM(source: input)
        XCTAssertEqual(vm.runUntilDoneAndPatch(), 8)
    }

    func test_part2() {
        let result = doDay8_part2()
        XCTAssertEqual(result, 1539)
    }
}
