//: Playground - noun: a place where people can play

import UIKit


extension Comparable {
    func lessThan(array items: [Self]) -> Bool {
        for item in items {
            if item <= self {
                return false
            }
        }
        return true
    }
}

5.lessThan(array: [6, 7, 8]) // true
5.lessThan(array: [5, 6, 7]) // false
"cat".lessThan(array: ["dog", "fish", "gorilla"]) // true
