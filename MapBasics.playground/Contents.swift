//: Playground - noun: a place where people can play

import UIKit

// Conventional usage
func lenghtOf(strings: [String]) -> [Int] {
    var result = [Int]()
    for string in strings {
        result.append(string.count)
    }
    
    return result
}

// Functional usage with .map
func lenghtOfFn(strings: [String]) -> [Int] {
    return strings.map { $0.count }
}

