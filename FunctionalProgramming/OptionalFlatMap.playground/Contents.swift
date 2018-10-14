//: Playground - noun: a place where people can play

import UIKit

let stringNumber: String? = "5"
let intNumber = stringNumber.map { Int($0) }
print(intNumber) //Returns Optional(Optional(5)) or an Int?? of value 5

let flatMapNumber = stringNumber.flatMap { Int($0) }
print(flatMapNumber) //Returns Optional(5) or an Int? of value 5

//Note: If the transformation closure returns optional, flatMap should be used
