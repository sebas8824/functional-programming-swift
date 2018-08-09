//: Playground - noun: a place where people can play

import UIKit

let i: Int? = 10
let j = i.map { $0 * 2 }
print(j)

func fetchUsername(id: Int) -> String? {
    if id==1988 {
        return "Sebastian"
    } else {
        return nil
    }
}

// Using optional value
var username: String? = fetchUsername(id: 1988)
let formattedUsername = username.map { "Welcome, \($0)!" } ?? "Unknown user"
print(formattedUsername)

// Not using optional value
let username2 = fetchUsername(id: 1988)
let formattedUsername2: String
if let username = username {
    formattedUsername2 = "Welcome, \(username)!"
} else {
    formattedUsername2 = "Unknown user"
}
print(formattedUsername2)

// Using forced unwrapping
let username3 = fetchUsername(id: 1988)
let formattedUsername3 = username != nil ? "Welcome, \(username!)": "Unknown user"
print(formattedUsername3)
