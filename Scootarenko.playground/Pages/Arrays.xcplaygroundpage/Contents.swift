//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Задание №1
let daysInMonthes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
print(daysInMonthes)
let namesOfMonthes = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
for (index, days) in daysInMonthes.enumerated() {
    print("\(namesOfMonthes[index]) contains \(days) days")
}

// Задание №2
var dayInMonthArr = [(String, Int)]()
for i in 0..<daysInMonthes.count {
    let monthDay = (namesOfMonthes[i], daysInMonthes[i])
    dayInMonthArr.append(monthDay)
}
dayInMonthArr

for i in dayInMonthArr {
    print("\(i.0) contaiins \(i.1) days")
}

// Задание №3
var index = 0
index = dayInMonthArr.endIndex-1
for _ in 1...daysInMonthes.count {
    print("\(namesOfMonthes[index]) contains \(daysInMonthes[index]) days")
    index -= 1
}

// Задание №4
let daysInMonthes1 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var secondsToMyBD = 0
index = 0
for i in daysInMonthes1 {
    while index <= 2 {
        secondsToMyBD += i
        index += 1
    }
    if i == daysInMonthes1[3] {
        secondsToMyBD += 22
    }
    break
}
secondsToMyBD * 24 * 60 * 60

// second case, only days to my BD
var dob = (month: 4, days: 22)
var days = 0
for i in 0...(dob.month - 1) {
    days += daysInMonthes1[i]
}
days += dob.days

// Задание №5
var optArr: [Int?] = [32, nil, 53, nil, 321, 232, nil, 321]

// optional binding
var sum = 0
for i in optArr {
    if let i = i {
        sum += i
    }
}

// force unwrapping
sum = 0
for i in optArr {
    if i != nil {
        sum += i!
    }
}

// nil coalesing
sum = 0
for i in optArr {
    sum += i ?? 0
}
sum

// Задание №6
var alphabet = "abcdefghijklmnopqrstuvwxyz"
var stringArr = [String]()
for i in alphabet {
    stringArr.insert(String(i), at: 0)
}
stringArr
