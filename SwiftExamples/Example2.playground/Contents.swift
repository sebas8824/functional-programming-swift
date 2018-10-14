//: Playground - noun: a place where people can play

import UIKit

extension BinaryInteger {
    func clamp(low: Self, high: Self) -> Self {
        return min(max(self, low), high)
    }
}

8.clamp(low: 5, high: 10) // Should return 8 because is between low and high
3.clamp(low: 5, high: 10) // Should return 5 because is lowest than 5
800.clamp(low: 5, high: 100) // Should return 100 because is higher than 100
