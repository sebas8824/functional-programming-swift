//: Playground - noun: a place where people can play

import UIKit

let fruits = ["Apple", "Cherry", "Orange", "Pineapple"]
let upperFruits = fruits.map { $0.uppercased() }
upperFruits

let scores = [100, 80, 85]
let formatted = scores.map { "Your score was \($0)" }
formatted

let passOrFail = scores.map { $0 > 85 ? "Pass": "Fail" }
passOrFail

let position = [50, 60, 40]
let averageResults = position.map { 45...55 ~= $0 ? "Withing average": "Outside average" }
averageResults

let numbers: [Double] = [4, 9, 25, 49]
let result = numbers.map(sqrt)

