//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Задание №1
var studentsMarks = ["Eugene Kirilov": 10, "Alexandr Leshchenia": 9, "Andrew White": 4, "Kirill Maximov": 10, "Alex Scoorarenko": 9]

// some students increase their marks
studentsMarks["Alexandr Leshchenia"] = 10
studentsMarks["Andrew White"] = 6

// class has 2 new students
studentsMarks["Viktor Pavlov"] = 8
studentsMarks["Pavel Blacker"] = 7

// 2 students don't want to continue study
studentsMarks["Alex Scoorarenko"] = nil
studentsMarks["Andrew White"] = nil

// common mark of this class
var commonMark = 0
for mark in studentsMarks.values {
    commonMark += mark
}
commonMark

// average mark of the class
let averageMark = commonMark / studentsMarks.count

// Задание №2
let namesOfMonthes = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
let daysInMonthes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var yearDict = Dictionary.init(uniqueKeysWithValues: zip(namesOfMonthes, daysInMonthes))

// 1
for (month, day) in yearDict {
    let tuple = (month, day)
    print("\(tuple.0) has \(tuple.1) days")
}

// 2
for month in yearDict.keys {
    print("\(month) has \(yearDict[month] ?? 0) days")
}

// Задание №3
let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
var chessDesk = [String: Bool]()
for i in 0..<letters.count {
    for j in numbers {
        if i % 2 == j % 2 {
            chessDesk[letters[i] + String(j)] = true
        } else {
            chessDesk[letters[i] + String(j)] = false
        }
    }
}
print(chessDesk)
