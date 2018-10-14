//: Playground - noun: a place where people can play

import UIKit


/* Building an extension of the Equatable protocol in order to
 compare all the items in a given array and return true if all of its
 items are the same of the evaluated expression
 */
extension Equatable {
    func matches(array items: [Self]) -> Bool {
        for item in items {
            if item != self {
                return false
            }
        }
        return true
    }
}

2.matches(array: [2, 2, 2, 2]) // True
2.matches(array: [2, 2, 2, 3]) // False
"2".matches(array: ["2", "2"]) // True
"1".matches(array: ["2", "1"]) // False
