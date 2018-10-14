//: Playground - noun: a place where people can play

import UIKit

// .filter: Loops over every item of the collection and passes it into a function that you write.

let fibonacciNumbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
let evenFibonacci = fibonacciNumbers.filter { $0 % 2 == 0 }
print(evenFibonacci)

let names = ["Michael Jackson", "Taylor Swift", "Michael Cane", "Adele Atkins", "Michael Jordan"]
let result = names.filter { $0.hasPrefix("Michael") }
print(result) // Will filter only the Michaels

let words = ["1989", "Fearless", "Red"]
let input = "My favorite album is fearless"
let result2 = words.filter { input.contains($0.lowercased()) }
print(result2) // Will show "Fearless"

let words2 = ["1989", nil, "Fearless", nil, "Red"]
let result3 = words2.filter { $0 != nil }
print(result3) // Will print a [String?] array with the members that have an assigned value

let scores = ["Sebastian": 100, "Alejandra": 99, "Judith": 90, "Toby": 45]
let goodScores = scores.filter { $1 > 85 } // $1 references to the numerical member
goodScores.forEach { print("\($0.0) has scored \($0.1) points!")}
