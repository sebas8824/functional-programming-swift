//: Playground - noun: a place where people can play

import Cocoa

// MARK: Naive approach
func sum(_ n: UInt) -> UInt {
    var result: UInt = 0
    
    for i in 1...n {
        result += i
    }
    return result
}

let step = 100

var execTime: Double
for i in 1...10 {
    execTime = BenchTimer.measureBlock {
        _ = sum(UInt(i*step))
    }
    print("Average sum(n) execution time for \(i*step) elements: \(execTime)")
}

// MARK: Second approach
func sumOptimized(_ n: UInt) -> UInt {
    return n * (n + 1) / 2
}

for i in 1...10 {
    execTime = BenchTimer.measureBlock {
        _ = sumOptimized(Uint(i*step))
    }
    print("Average sum(n) execution time for \(i*step) elements: \(execTime)")
}
