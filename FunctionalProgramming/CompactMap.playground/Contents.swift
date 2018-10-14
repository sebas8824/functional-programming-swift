//: Playground - noun: a place where people can play

import UIKit


let albums: [String?] = ["Fearless", nil, "Speak now", nil, "Red"]
let mapResult = albums.map { $0 }

// This will return an optional String array
print(mapResult)

/* .compactMap operation works with Swift 4.1, the usage for Swift 4.0 is .flatMap */
let compactMapResult = albums.flatMap { $0 }
// This will return a raw String array, since compact takes care of the optional wrapper.
print(compactMapResult)
