//: Playground - noun: a place where people can play

import UIKit

/*
 Extension for specific data types using Collection
 Equatable: Guarantees the support of ==
 */

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
