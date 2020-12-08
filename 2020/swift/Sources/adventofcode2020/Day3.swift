//
//  File.swift
//  
//
//  Created by Andy Best on 07/12/2020.
//

import Foundation

struct TreeMap {
    let map: [[Bool]]

    var width: Int { map.first?.count ?? 0 }
    var height: Int { map.count }

    init(string: String) {
        map = getTreeInput(from: string)
    }

    init(fromResourceWithName name: String, andExtension fileExtension: String?) {
        map = getTreeInput(fromResourceWithName: name, andExtension: fileExtension)
    }

    subscript(x: Int, y: Int) -> Bool {
        get {
            return map[y][x % width]
        }
    }

    func calculateSlope(right: Int, down: Int) -> Int {
        var count = 0
        var x = 0
        var y = 0

        while y < height {
            if self[x, y] { count += 1 }
            x += right
            y += down
        }

        return count
    }
}

func doDay3_part1() -> Int {
    let map = TreeMap(fromResourceWithName: "input_day3", andExtension: "txt")
    return map.calculateSlope(right: 3, down: 1)
}

func doDay3_part2() -> Int {
    let map = TreeMap(fromResourceWithName: "input_day3", andExtension: "txt")
    let results = [
        map.calculateSlope(right: 1, down: 1),
        map.calculateSlope(right: 3, down: 1),
        map.calculateSlope(right: 5, down: 1),
        map.calculateSlope(right: 7, down: 1),
        map.calculateSlope(right: 1, down: 2)
    ]

    return results.reduce(1, *)
}
