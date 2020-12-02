
import Foundation
import XCTest

@testable import adventofcode2020

class Day2Tests: XCTestCase {
    func test_inputParsesCorrectly() {
        let testInput = """
        1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc
        """

        let results = getPasswordInput(from: testInput)

        XCTAssertEqual(results.count, 3)

        let r1 = results[0]
        XCTAssertEqual(r1.rangeRequirement, 1..<4)
        XCTAssertEqual(r1.requiredLetter, "a")
        XCTAssertEqual(r1.input, "abcde")
        XCTAssertTrue(r1.isValid)

        let r2 = results[1]
        XCTAssertEqual(r2.rangeRequirement, 1..<4)
        XCTAssertEqual(r2.requiredLetter, "b")
        XCTAssertEqual(r2.input, "cdefg")
        XCTAssertFalse(r2.isValid)

        let r3 = results[2]
        XCTAssertEqual(r3.rangeRequirement, 2..<10)
        XCTAssertEqual(r3.requiredLetter, "c")
        XCTAssertEqual(r3.input, "ccccccccc")
        XCTAssertTrue(r3.isValid)
    }

    func test_characterFrequencies() {
        let input = "abbcdded"
        let result = input.characterFrequencies

        XCTAssertEqual(result["a"], 1)
        XCTAssertEqual(result["b"], 2)
        XCTAssertEqual(result["c"], 1)
        XCTAssertEqual(result["d"], 3)
    }

    func test_day2_part1() {
        let result = doDay2_part1()

        XCTAssertEqual(result, 414)
    }

    func test_day2_part2() {
        let result = doDay2_part2()

        XCTAssertEqual(result, 413)
    }
}
