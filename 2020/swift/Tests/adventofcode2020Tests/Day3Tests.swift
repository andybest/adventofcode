//
//  File.swift
//  
//
//  Created by Andy Best on 07/12/2020.
//

import Foundation
import XCTest

@testable import adventofcode2020

class Day3Tests: XCTestCase {
    func test_calculatesTestSlope() {
        let input = TreeMap(string: """
                ..##.......
                #...#...#..
                .#....#..#.
                ..#.#...#.#
                .#...##..#.
                ..#.##.....
                .#.#.#....#
                .#........#
                #.##...#...
                #...##....#
                .#..#...#.#
                """)

        XCTAssertEqual(input.width, 11)
        XCTAssertEqual(input.height, 11)

        XCTAssertEqual(input.calculateSlope(right: 3, down: 1), 7)
    }

    func test_calculatesPart2TestSlopes() {
        let input = TreeMap(string: """
                ..##.......
                #...#...#..
                .#....#..#.
                ..#.#...#.#
                .#...##..#.
                ..#.##.....
                .#.#.#....#
                .#........#
                #.##...#...
                #...##....#
                .#..#...#.#
                """)

        XCTAssertEqual(input.calculateSlope(right: 1, down: 1), 2)
        XCTAssertEqual(input.calculateSlope(right: 3, down: 1), 7)
        XCTAssertEqual(input.calculateSlope(right: 5, down: 1), 3)
        XCTAssertEqual(input.calculateSlope(right: 7, down: 1), 4)
        XCTAssertEqual(input.calculateSlope(right: 1, down: 2), 2)

    }

    func test_day3Part1() {
        XCTAssertEqual(doDay3_part1(), 211)
    }

    func test_day3Part2() {
        XCTAssertEqual(doDay3_part2(), 3584591857)
    }
}
