//
//  File.swift
//  
//
//  Created by Andy Best on 02/12/2020.
//

import Foundation

extension String {
    var characterFrequencies: [Element: Int] {
        var frequencies: [Element: Int] = [:]
        for char in self {
            frequencies[char] = (frequencies[char] ?? 0) + 1
        }
        return frequencies
    }
}


extension String {
    func match(_ pattern: String) -> RegexMatchResult? {
        return RegexMatcher(pattern: pattern)?.match(self)
    }
}

class RegexMatchResult {
    let input: String
    let result: [NSTextCheckingResult]

    init(input: String, result: [NSTextCheckingResult]) {
        self.input = input
        self.result = result
    }

    subscript(index: Int) -> String {
        let range = result[0].range(at: index)
        return (input as NSString).substring(with: range)
    }
}

class RegexMatcher {
    let regex: NSRegularExpression

    init?(pattern: String) {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return nil }
        self.regex = regex
    }

    func match(_ input: String) -> RegexMatchResult {
        let result = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.count))
        return RegexMatchResult(input: input, result: result)
    }
}
