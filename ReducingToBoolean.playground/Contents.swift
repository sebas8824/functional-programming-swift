//: Playground - noun: a place where people can play

import UIKit

let names = ["Sebastian", "Aleja", "Judith"]

// Evaluate if a name in the names array has a lenght greater than 4
/* starts with true because of the constructor of the function:
 As $0 is true at the beggining then:
 true && "Sebastian".count > 5 is true, then this one is true because true && true is true
 next, $0 is the previous eval that was true && "Aleja".count > 5 is false, then returns false because true && false is false
 finally, $0 is false && "Judith".count > 5 is true, then returns false, because true && false is false.
 */
let longEnough = names.reduce(true) { $0 && $1.count > 5 }
print(longEnough)//false


