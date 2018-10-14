//: Playground - noun: a place where people can play

import UIKit

// Extension for Collections of specific datatypes
extension Collection where Iterator.Element: Equatable {
    func myContains(element: Iterator.Element) -> Bool {
        for item in self {
            if item == element {
                return true
            }
        }
        return false
    }
}
