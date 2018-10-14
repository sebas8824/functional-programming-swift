//: Playground - noun: a place where people can play

import UIKit

/*
 Conforming to a data type Int to obtain the number of elements found in the constructor
 */
extension Collection where Iterator.Element == Int {
    func numberOfNs(_ number: String) -> Int {
        var count = 0
        for item in self {
            let str = String(item)
            for letter in str {
                if letter == Character(number) {
                    count += 1
                }
            }
        }
        return count
    }
}


[5, 3, 5, 1, 5].numberOfNs("4") // 3
[5, 15, 55, 555].numberOfNs("5") // n 5's
