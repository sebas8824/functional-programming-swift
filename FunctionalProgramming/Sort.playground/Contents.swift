//: Playground - noun: a place where people can play

import UIKit

let scoresString = ["100", "95", "85", "90", "100"]
let sortedString1 = scoresString.sorted()
print(scoresString)

// Convert them to Int
let scoresInt = scoresString.flatMap { Int($0) } //* remember the use of .compactMap
let sortedInt = scoresInt.sorted()
print(sortedInt)

// Convert each value to integer and compare one to another using a custom sorted function
let sortedString2 = scoresString.sorted {
    if let first = Int($0), let second = Int($1) {
        return first < second
    } else {
        return false
    }
}

print(sortedString2)

// Using map to create an [Int?] to do the same as the sortedString2 variable
let scoresInt2 = scoresString.map { Int($0) }
print(scoresInt2)
let sortedInt2 = scoresInt2.sorted {
    if let unwrappedFirst = $0, let unwrappedSecond = $1 {
        return unwrappedFirst < unwrappedSecond
    } else {
        return false
    }
}
// but it returns an [Int?]
print(sortedInt2)
