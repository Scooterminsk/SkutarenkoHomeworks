//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let str1 = "abds1 fdf"
(str1 as NSString).length
str1.hasPrefix("abds1")
str1.hasSuffix("fdf")

// Задание №1
let a = "22"
let b = "223ab"
let c = "43"
let d = "fd"
let e = "455"

// transfer String variables to Int with help of nil coalesing
var aToInt = Int(a) ?? 0
var bToInt = Int(b) ?? 0
var cToInt = Int(c) ?? 0
var dToInt = Int(d) ?? 0
var eToInt = Int(e) ?? 0

// getting sum of unwrapped optionals with help of concatenation
var strResult = String(aToInt + bToInt + cToInt + dToInt + eToInt)

// then with help of interpolation
print("\(aToInt) + nil + \(cToInt) + nil + \(eToInt) = \(strResult)")

// Задание №2
// creating string of cool emoji
let coolEmojiStr = "🥱🤥😈💦🔥"

// count of elements with method
coolEmojiStr.count

// count of elements with help of Objective-C functional NSString
(coolEmojiStr as NSString).length

// Задание №3
var alphabet = "abcdefghijklmnopqrstuvwxyz"
let xChar: Character = "x"
var index = 0
for char in alphabet {
    if char == xChar {
        print("Index of 'x' is \(index)")
        break
    }
    index += 1
}
