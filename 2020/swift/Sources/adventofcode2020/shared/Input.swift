//
//  File.swift
//  
//
//  Created by Andy Best on 01/12/2020.
//

import Foundation

func getIntInputArray(from str: String) -> [Int] {
    return str.split(separator: "\n")
        .compactMap { Int($0) }
}


func getIntInputArray(from url: URL) -> [Int] {
    guard let data = try? Data(contentsOf: url),
          let str = String(data: data, encoding: .utf8) else {
        fatalError("Unable to fetch input data from \(url)")
    }

    return getIntInputArray(from: str)
}
