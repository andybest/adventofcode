import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(adventofcode2020Tests.allTests),
    ]
}
#endif
