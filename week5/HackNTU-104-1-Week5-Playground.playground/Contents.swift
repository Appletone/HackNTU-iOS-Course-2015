//: Playground - noun: a place where people can play

import UIKit
import Swift

var str = "Hello, playground"

/*  Class  */

class Human {
    var hand = "手"
    var foot = "腳"
    
}

class Ryu : Human {

    func 昇龍拳() {
        print("→↓→ + \(hand)")
    }
}

Ryu().昇龍拳()

/*  Enum  */

enum Status {
    case Success
    case Error
}

let replyStatus = Status.Success

if replyStatus == Status.Success {
    print("Status.Success")
}

enum Letters: String {
    case a = "A"
    case b = "B"
    case c = "C"
}

let letterA = Letters.a
letterA

//Letters.a == "A" // ERROR!
Letters.a.rawValue == "A"


/*  Struct  */

struct Location {
    let lat:Double
    let lon:Double
}
// 台大座標 25.017354, 121.539907
let ntu = Location(lat: 25.017354, lon: 121.539907)


/* Optional */
// Optional is enum
let okint = Int("123")
print(okint)



