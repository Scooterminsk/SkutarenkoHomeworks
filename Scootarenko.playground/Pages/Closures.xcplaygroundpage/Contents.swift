//: [Previous](@previous)

import Foundation
import Darwin

var greeting = "Hello, playground"

//: [Next](@next)

// MARK: Exercise #1
// create function with closure in input parameters
func numsCount (c: () -> Void) {
    var sum = 0
    for i in 1...10 {
        sum += i
        print("Loop iteration number \(i)")
    }
    print("Sum of numbers from 1 to 10 equals \(sum)")
    c()
}
numsCount {
    print("Function ends")
}

// MARK: Exercise #2
// practice of sorting Int arrays
var intArr = [434, 23, 34, 96, 83, 8, 7, 2, 842, 4, 57]
intArr.sorted(by: < )
intArr.sorted(by: > )

// MARK: Exercise #3
// create function that has closure in its input parameters, function checks array's elements and initializes it to new var
func arrCheck (forArr: [Int], withClosure: (Int, Int?) -> Bool) -> Int {
    var value: Int?
    for number in forArr {
        if withClosure(number, value) {
            value = number
        }
    }
    return value ?? 0
}
// with help of the last function let's try to find the max element in intArr
let maxElement = arrCheck(forArr: intArr) { $1 == nil || $1 ?? 0 > $0 }
// with help of the last function let's try to find the max element in intArr
let minElement = arrCheck(forArr: intArr) { $1 == nil || $1 ?? 0 < $0 }
minElement

// MARK: Ecercise #4
// var of different letters, numbers and symbols
var randomStr = "dsfhuifsdhfdiufhw12912&dsjdis''.,/]'dsj121"
var strArr = [String]()
var separateDictionary = [String:Int]()
for char in randomStr {
    strArr.append(String(char))
    let char = String(char).lowercased()
    if separateDictionary[char] == nil {
        switch char {
        case "a", "e", "i", "o", "u", "y":
            separateDictionary[char] = 1
        case "b"..."z":
            separateDictionary[char] = 2
        case "0"..."9":
            separateDictionary[char] = 3
        default:
            separateDictionary[char] = 4
        }
    }
}

// default sort method
strArr.sorted(by: <)
// now let's sort this array by our new method
let sortedArr = strArr.sorted {str1, str2 in
    if separateDictionary[str1] ?? 0 < separateDictionary[str2] ?? 0{
        return true
    } else if separateDictionary[str1] == separateDictionary[str2] {
        return str1 < str2
    } else {
        return false
    }
}
print(sortedArr)

// MARK: Exercise #5
// create function same as in the exercise #3, but to sort String array
func strArrCheck (forArr: [String], withClosure: (String, String?) -> Bool) -> String {
    var value: String?
    for char in forArr {
        if withClosure(char, value) {
            value = char
        }
    }
    return value!
}
// with help of the last function let's try to find the max element in intArr
let strMaxElement = strArrCheck(forArr: strArr) { $1 == nil || $1 ?? "ops" > $0 }
// with help of the last function let's try to find the max element in intArr
let strMinElement = strArrCheck(forArr: strArr) { $1 == nil || $1 ?? "ops" < $0 }
minElement
