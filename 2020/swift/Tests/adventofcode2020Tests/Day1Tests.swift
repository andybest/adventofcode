//
//  File.swift
//  
//
//  Created by Andy Best on 01/12/2020.
//

import Foundation
import XCTest

@testable import adventofcode2020

class Day1Tests: XCTestCase {
    func test_uniqueCombinations_areCorrect() {
        let testInput = [1, 2, 3]
        let result = uniqueCombinations(of: testInput, ofSize: 2)

        XCTAssertEqual(result, [
            [1, 2],
            [1, 3],
            [2, 3]
        ])
    }

    func test_findProductOfPairs() {
        guard let result = findProduct(in: [1, 2], withSum: 3, ofSize: 2) else {
            XCTFail("Expected result")
            return
        }

        XCTAssertEqual(result, 2)
    }

    func test_findProductOfTriplets() {
        guard let result = findProduct(in: [1721, 979, 366, 299, 675, 1456], withSum: 2020, ofSize: 3) else {
            XCTFail("Expected result")
            return
        }

        XCTAssertEqual(result, 241861950)
    }

    func test_exampleGiven() {
        let testInput = [1721, 979, 366, 299, 675, 1456]
        guard let result = findProduct(in: testInput, withSum: 2020, ofSize: 2) else {
            XCTFail("Expected a result")
            return
        }

        XCTAssertEqual(result, 514579)
    }

    func test_day1_part1() {
        let result = doDay1_part1()
        XCTAssertEqual(result, 987339)
    }

    func test_day1_part2() {
        let result = doDay1_part2()
        XCTAssertEqual(result, 259521570)
    }
}
