//: Playground - noun: a place where people can play


/* O(1) Complexity: Algorithms that are not affected by the size of the input */
import Foundation
import QuartzCore

public class BenchTimer {
    public static func measureBlock(closure: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[1] = execTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}

// MARK: Constant time

func startsWithZero(array: [Int]) -> Bool {
    guard array.count != 0 else {
        return false
    }
    return array.first == 0 ? true : false
}

var small = [1, 0, 0]
var exectime = BenchTimer.measureBlock {
    _ = startsWithZero(array: small)
}
print("Average execution for an small array: \(exectime)")

var medium = Array<Int>(repeating: 0, count: 10000)
exectime = BenchTimer.measureBlock {
    _ = startsWithZero(array: medium)
}
print("Average execution for a medium array: \(exectime)")

var large = Array<Int>(repeating: 0, count: 100000)
exectime = BenchTimer.measureBlock {
    _ = startsWithZero(array: large)
}
print("Average execution for a large array: \(exectime)")

// MARK: Dictionary Search */

func generateDict(size: Int) -> Dictionary<String, Int> {
    var result = Dictionary<String, Int>()
    guard size > 0 else {
        return result
    }
    
    for i in 0..<size {
        let key = String(i)
        result[key] = i
    }
    return result
}

let smallDictionary = ["one": 1, "two": 2, "three": 3]
exectime = BenchTimer.measureBlock {
    _ = smallDictionary["two"]
}
print("Average execution for small dictionary: \(exectime)")

let mediumDictionary = generateDict(size: 100)
exectime = BenchTimer.measureBlock {
    _ = mediumDictionary["78"]
}
print("Average execution for medium dictionary: \(exectime)")


