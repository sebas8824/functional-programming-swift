//: Playground - noun: a place where people can play

import UIKit

let scoreString = ["100","95","85","90","100"]

let sortedString = scoreString.sorted {
    if let first = Int($0), let second = Int($1) {
        return first > second
    } else {
        return false
    }
}

print(sortedString)

// Strings, Integers, Arrays, Structs are all immutable
let names = ["Sebastian", "Alejandra", "Judith", "Toby"]
print(names)

let sorted = names.sorted().reversed()
print(sorted) // Returns a lazy array because stores the original array on the _base value
// ReversedRandomAccessCollection<Array<String>>(_base: ["Alejandra", "Judith", "Sebastian", "Toby"])

let sortedArray = Array(names.sorted().reversed())
print(sortedArray) // Returns an array
//["Toby", "Sebastian", "Judith", "Alejandra"]
