//: Playground - noun: a place where people can play

import UIKit

// Lazy sequences

let numbers = Array(1...10000)
let lazyFilter = numbers.lazy.filter { $0 % 2 == 0 }
let lazyMap = numbers.lazy.map { $0 * 2 }

// Performs the filter by each call of the count
print(lazyFilter.count)
print(lazyFilter.count)

// Execute the map function immediately
print(lazyMap[5000])
print(lazyMap[5000])
print(lazyMap[5000])



