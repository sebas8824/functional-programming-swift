//: Playground - noun: a place where people can play

import UIKit

// Conforming to the comparable protocol it uses the Swift built-in sorted method
// Is built on the Equatable protocol (==)
struct Person: Comparable {
    var name: String
    var age: Int
    
    //
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

let sebastian = Person(name: "Sebastian", age: 29)
let angela = Person(name: "Angela", age: 29)
let judith = Person(name: "Judith", age: 64)
let alicia = Person(name: "Alicia", age: 27)

let people = [sebastian, angela, alicia, judith]

let sortedPeople = people.sorted { $0.name < $1.name }
// It performs the sorted but as an struct using the name only, and is fine when there is no need to repeat the operation more than once,
print(sortedPeople)

// After the struct Person is conforming to the Comparable protocol the sorted  method can be used.
let sortedPeople2 = people.sorted()
print(sortedPeople2) // Returns the list of names, sorted alphabetically because of the < function.

