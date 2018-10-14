//: Playground - noun: a place where people can play

import UIKit

/*
 Does not require Iterator because it is for Collections and not Array
 which in this case is being specified already
 */
extension Array where Element: Equatable {
    func uniqueValues() -> [Element] {
        /* Element is the type of each element in the Array */
        var result = [Element]()
        
        for item in self {
            if !result.contains(item) {
                result.append(item)
            }
        }
        return result
    }
}

// Equatable:testing equality
// Comparable:compare values
