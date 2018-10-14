//: Playground - noun: a place where people can play

import UIKit

/* CompactMap: Useful for failable operations, because it will ignore the nil values and return the type of the datum */

let albums: [String?] = ["Value1", nil, "Value2", nil, "Value3"]
let result = albums.compactMap { $0 }
print(result)

let scores = ["100", "99", "Text", "9"]
let compactMapScores = scores.compactMap { Int($0) }
print(compactMapScores)
// [100, 99, 9]

let files = (1...10).compactMap { try? String(contentsOfFile: "somefile-\($0).txt") }
print(files)
// [] : Since these files don't exist, it throws an error, but compactMap handles it by returning an empty value, and because of this the 10 non-existent files appear like an empty array.

let view = UIView()
let labels = view.subviews.compactMap { $0 as? UILabel }
// The labels object will be filtering all of the UILabel type elements ignoring the other possible UIView elements.
