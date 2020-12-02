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
