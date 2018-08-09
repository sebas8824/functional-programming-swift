//: Playground - noun: a place where people can play

import UIKit

// .reduce: Condenses an array into a single value by applying a function to every item.

let scores = [100, 90, 95]
// Zero is initial value, + is the aritmethic operation
let sum = scores.reduce(0, +)
print(sum) //285

let result = scores.reduce("") { $0 + String($1) }
print(result) //1009095

// func reduce(_ initial: T, _ combine: (T, Int) throws -> T)


// Obtain the sum of characters of the names
let names = ["Sebastian", "Alejandra", "Judith"]

/* Imperatively approach
 var count = 0
 for name in names {
    count += name.count // this is where the operation is reduced to $0 + $1.count
 
 }
 
 */
// $0 here is the type of the variable, $1 is the evaluated variable
let r = names.reduce(0) { $0 + $1.count }
print(r)
