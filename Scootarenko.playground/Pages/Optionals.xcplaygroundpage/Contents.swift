//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Задание №1
let a = "22"
let b = "223ab"
let c = "43"
let d = "fd"
let e = "455"
var result = 0

if let first = Int(a) {
    result += first
} else {
    print("Oops, something goes wrong with a const")
}

if let second = Int(b) {
    result += second
} else {
    print("Oops, something goes wrong with b const")
}

result += Int(c)!

if let fourth = Int(d) {
    result += fourth
} else {
    print("Oops, something goes wrong with d const")
}

if let fifth = Int(e) {
    result += fifth
} else {
    print("Oops, something goes wrong with e const")
}

print("The result of addition operation is \(result)")

// Задание №2
var serverResponse: (statusCode: Int, message: String?, errorMessage: String?) = (245, "It's okay, you're online now", "Internal server error")
if (200..<300).contains(serverResponse.statusCode) {
    if let message = serverResponse.message {
        print(message)
    }
} else {
    if let errorMessage = serverResponse.errorMessage {
        print(errorMessage)
    }
}

var serverResponse1: (message: String?, errorMessage: String?) = (nil, "External server error")

if let message = serverResponse1.message {
    print(message)
}
if let errorMessage = serverResponse1.errorMessage {
    print(errorMessage)
}

// Задание №3
var student1: (name: String?, carNumber: String?, mark: Int?)
var student2: (name: String?, carNumber: String?, mark: Int?)
var student3: (name: String?, carNumber: String?, mark: Int?)
var student4: (name: String?, carNumber: String?, mark: Int?)
var student5: (name: String?, carNumber: String?, mark: Int?)

student1.name = "Eugene"
student2.name = "Kirill"
student3.name = "Alex"
student4.name = "Olga"
student5.name = "Anastasia"
student1.carNumber = "2526kr7"
student4.carNumber = "1242iv2"
student5.carNumber = "2385rb7"
student1.mark = 10
student2.mark = 8
student3.mark = 9
student5.mark = 10

print("The name of the first student is \(student1.name!)")
if let carNumber = student1.carNumber {
    print("The number of the car of the first student is \(carNumber)")
}
if let mark = student1.mark {
    print("His mark of the test is \(mark)")
}

print("The name of the second student is \(student2.name!)")
if let carNumber = student2.carNumber {
    print("The number of the car of the second student is \(carNumber)")
}
if let mark = student2.mark {
    print("His mark of the test is \(mark)")
}

print("The name of the third student is \(student3.name!)")
if let carNumber = student3.carNumber {
    print("The number of the car of the third student is \(carNumber)")
}
if let mark = student3.mark {
    print("His mark of the test is \(mark)")
}

print("The name of the fourth student is \(student4.name!)")
if let carNumber = student4.carNumber {
    print("The number of the car of the fourth student is \(carNumber)")
}
if let mark = student4.mark {
    print("Her mark of the test is \(mark)")
}

print("The name of the fifth student is \(student5.name!)")
if let carNumber = student5.carNumber {
    print("The number of the car of the fifth student is \(carNumber)")
}
if let mark = student5.mark {
    print("Her mark of the test is \(mark)")
}
