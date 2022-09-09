//: [Previous](@previous)

import UIKit

var greeting = "Hello, playground"

//: [Next](@next)

// Задание №1
let intMax = Int.max
let intMin = Int.min

let int8Max = Int8.max
let int8Min = Int8.min

let uintMax = UInt.max
let uintMin = UInt.min

let uint8Max = UInt8.max
let uint8Min = UInt8.min

let floatMax = Float.greatestFiniteMagnitude
let floatMin = -Float.greatestFiniteMagnitude

let doubleMax = Double.greatestFiniteMagnitude
let doubleMin = -Double.greatestFiniteMagnitude

print("Максимальное значение Int = \(intMax)")
print("Минимальное значение Int = \(intMin)")

print("Максимальное значение Int8 = \(int8Max)")
print("Минимальное значение Int8 = \(int8Min)")

print("Максимальное значение UInt = \(uintMax)")
print("Минимальное значение UInt = \(uintMin)")

print("Максимальное значение UInt8 = \(uint8Max)")
print("Минимальное значение UInt8 = \(uint8Min)")

print("Максимальное значение Float = \(floatMax)")
print("Минимальное значение Float = \(floatMin)")

print("Максимальное значение Double = \(doubleMax)")
print("Минимальное значение Double = \(doubleMin)")

// Задание №2
let intLet = 12
let doubleLet = 54.6
let floatLet: Float = 32.1

let intRes = intLet + Int(doubleLet) + Int(floatLet)
let floatRes = Float(intLet) + Float(doubleLet) + floatLet
let doubleRes = Double(intLet) + doubleLet + Double(floatLet)

// Задание №3
if Double(intRes) < doubleRes {
    print("Double")
} else if Double(intRes) == doubleRes {
    print("Double equal to Int")
} else {
    print("Int")
}
