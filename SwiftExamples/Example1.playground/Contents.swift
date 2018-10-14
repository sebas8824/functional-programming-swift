//: Playground - noun: a place where people can play

import UIKit

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let i: Int = 8
print(i.squared())

/* Has to change to an extension for BinaryIntegers
 because Int does not cover UInt, its wrapper class is BinaryInteger
 hence the extension.
 */

extension BinaryInteger {
    func squared() -> Self {
        return self * self
    }
}

let j: UInt = 8
print(j.squared())


