//: Playground - noun: a place where people can play

import UIKit


// Extending a class based on the element type conforming a protocol
/*
 It is not needed to define on the signature [Self] because of the where clause
 that is conditioned to the element type of the Iterator conforming to Comparable
 protocol.
 */
extension Collection where Iterator.Element: Comparable {
    func fuzzyMatches(_ other: Self) -> Bool {
        let usSorted = self.sorted()
        let otherSorted = other.sorted()
        return usSorted == otherSorted
    }
}

/* Fuzzy array matching */

[1, 2, 3].fuzzyMatches([1, 2, 3]) // true
[1, 2, 3].fuzzyMatches([3, 2, 1]) // true
[1, 2, 3].fuzzyMatches([1, 2]) // false
[1, 2, 3].fuzzyMatches([1, 2, 3, 1]) // false
