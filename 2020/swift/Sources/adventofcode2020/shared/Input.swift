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

func getIntInputArray(fromResourceWithName name: String, andExtension fileExtension: String?) -> [Int] {
    guard let url = Bundle.module.url(forResource: name, withExtension: fileExtension),
          let data = try? Data(contentsOf: url),
          let str = String(data: data, encoding: .utf8) else {
        fatalError("Unable to get input data")
    }
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

func getTreeInput(from str: String) -> [[Bool]] {
    return str.split(separator: "\n")
        .map { line in
            line.map { $0 == "#" }
        }
}

func getTreeInput(fromResourceWithName name: String, andExtension fileExtension: String?) -> [[Bool]] {
    guard let url = Bundle.module.url(forResource: name, withExtension: fileExtension),
          let data = try? Data(contentsOf: url),
          let str = String(data: data, encoding: .utf8) else {
        fatalError("Unable to get input data")
    }
    return getTreeInput(from: str)
}

func getPassportInput(fromResourceWithName name: String, andExtension fileExtension: String?) -> [[String: String]] {
    guard let url = Bundle.module.url(forResource: name, withExtension: fileExtension),
          let data = try? Data(contentsOf: url),
          let str = String(data: data, encoding: .utf8) else {
        fatalError("Unable to get input data")
    }
    return getPassportInput(from: str)
}

func getPassportInput(from str: String) -> [[String: String]] {
    var output: [[String: String]] = []
    var currentPassport: [String: String] = [:]

    for line in str.split(separator: "\n", omittingEmptySubsequences: false) {
        if line.isEmpty {
            output.append(currentPassport)
            currentPassport = [:]
            continue
        }

        let entries = line.split(separator: " ")
        for entry in entries {
            let kv = entry.split(separator: ":")
            guard kv.count == 2 else { fatalError("Invalid input") }
            currentPassport[String(kv[0])] = String(kv[1])
        }
    }

    output.append(currentPassport)
    return output
}

func getFileInput(fromResourceWithName name: String, andExtension fileExtension: String?) -> String {
    guard let url = Bundle.module.url(forResource: name, withExtension: fileExtension),
          let data = try? Data(contentsOf: url),
          let str = String(data: data, encoding: .utf8) else {
        fatalError("Unable to get input data")
    }
    return str
}
