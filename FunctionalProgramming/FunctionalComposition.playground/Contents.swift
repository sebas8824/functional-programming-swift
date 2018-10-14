//: Playground - noun: a place where people can play

import UIKit

// Function composition

precedencegroup CompositionPrecedence {
    associativity: left
}

// Declares new operator
infix operator >>>: CompositionPrecedence

// Accepts 3 data types placeholders (T, U, V)
// lhs: closure that accepts T and returns U
// rhs: closure that accepts U and returns V
// The whole function accepts a T and returns a V
// use @escaping because its output is used on the precedent function
func >>> <T, U, V>(lhs: @escaping (T) -> (U), rhs: @escaping (U) -> V) -> (T) -> V {
    return { rhs(lhs($0)) }
}

/* Degenerifying the function works like this */
// It accepts the input of the first (lhs) function: Int
// Returns the output of the last (rhs) function [String]
/* func >>> (lhs: @escaping (Int) -> String, rhs: @escaping (String) -> [String]) -> (Int) -> [String] {
    return { rhs(lhs($0))}
 } */

func rngesus(max: Int) -> Int {
    let number = Int(arc4random_uniform(UInt32(max)))
    print("Using number: \(number)")
    return number
}

func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0}
}

func reduceToString(numbers: [Int]) -> String {
    return numbers.reduce("Factors: ") { $0 + String($1) + " " }
}

// Normally you would do this:
let result = reduceToString(numbers: calculateFactors(number: rngesus(max: 100)))
print(result)

// An elegant solution using the >>> operator we created would be
/*
 Factors why this approach is better than the normal one:
    1. Read naturally
    2. Lets you save the combine function to be used as many times as you want
    3. You can compose your functions even further
    4. The combined function automatically accepts the same parameter the first function is composed.
 */
let combined = rngesus >>> calculateFactors >>> reduceToString
print(combined(100))
