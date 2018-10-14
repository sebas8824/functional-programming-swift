//: Playground - noun: a place where people can play

import UIKit

let names = ["Sebastian", "Aleja", "Judith"]
/* starts with ""
 then: "Sebastian".count > "".count -> "Sebastian"
 then: "Aleja".count > "Sebastian".count -> "Sebastian"
 then: "Judith".count > "Sebastian".count -> "Sebastian"
 */
let longest = names.reduce("") { $1.count > $0.count ? $1: $0 }
print(longest) // Sebastian is already unwrapped as String because of the starting "" in the reduce function
let longest2 = names.max { $1.count > $0.count }
print(longest2) // Optional("Sebastian") must be unwrapped

let numbers = [
    [1, 1, 2],
    [3, 5, 8],
    [13, 21, 34]
]

/* starts with []
 then: takes [] and appends [1, 1, 2] to it -> [1, 1, 2]
 then: takes [1, 1, 2] and appends [3, 5, 8] to it -> [1, 1, 2, 3, 5, 8]
 then: takes [1, 1, 2, 3, 5, 8] and appends [13, 21, 34] to it -> [1, 1, 2, 3, 5, 8, 13, 21, 34]
 */
let flattened: [Int] = numbers.reduce([]) { $0 + $1 }
print(flattened) // [1, 1, 2, 3, 5, 8, 13, 21, 34]
//.compactMap is for Swift 4.1, for older versions, use .flatMap
let flattened2 = numbers.flatMap { $0 }
print(flattened2)// [1, 1, 2, 3, 5, 8, 13, 21, 34]
let flattened3 = Array(numbers.joined())
print(flattened3) // [1, 1, 2, 3, 5, 8, 13, 21, 34]
