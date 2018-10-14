//: Playground - noun: a place where people can play

import UIKit

extension Collection where Iterator.Element == String {
    func averageLength() -> Double {
        var sum = 0
        var count = 0
        self.forEach {
            sum += $0.count
            count += 1
        }
        return Double(sum) / Double(count)
    }
}
