//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Задание №1
var daysToMyBirthday = 31 + 28 + 31 + 21
var hoursToMyBirthday = daysToMyBirthday * 24
var minutesToMyBirthday = hoursToMyBirthday * 60
var secondsToMyBirthday = minutesToMyBirthday * 60

var secondsToMyBirthday1 = (31 + 28 + 31 + 21) * 24 * 60 * 60

// Задание №2
var monthOfMyBirthday = "April"

if monthOfMyBirthday == "January" || monthOfMyBirthday == "February" || monthOfMyBirthday == "March" {
    print("Я родился в первом квартале")
} else if monthOfMyBirthday == "April" || monthOfMyBirthday == "May" || monthOfMyBirthday == "June" {
    print("Я родился во втором квартале")
} else if monthOfMyBirthday == "July" || monthOfMyBirthday == "August" || monthOfMyBirthday == "September" {
    print("Я родился в третьем квартале")
} else {
    print("Я родился в четвертом квартале")
}

// Задание №4
let chessCoords = (x: 2, y: 5)
if chessCoords.x % 2 == 1 && chessCoords.y % 2 == 1 {
    print("Your figure is on black cell")
} else if chessCoords.x % 2 == 1 && chessCoords.y % 2 == 0 {
    print("Your figure is on white cell")
} else if chessCoords.x % 2 == 0 && chessCoords.y % 2 == 1 {
    print("Your figure is on white cell")
} else {
    print("Your figure is on black cell")
}

// более короткий вариант решения
print((chessCoords.x + chessCoords.y) % 2 == 0 ? "black" : "white")
