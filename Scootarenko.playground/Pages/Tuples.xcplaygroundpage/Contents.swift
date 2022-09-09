import UIKit
import Foundation

var greeting = "Hello, playground"

// Задание №1

var myRecords = (pushUps: 50, pullUps: 20, squattings: 100)
print(myRecords)
print("Мое максимальное количество отжиманий равно \(myRecords.0)")
print("Мое максимальное количество подтягиваний равно \(myRecords.pushUps)")
print("Мое максимальное количество приседаний равно \(myRecords.squattings)")

// Задание №2
var myFriendsRecords = (pushUps: 30, pullUps: 15, squattings: 80)
var tmp: (pushUps: Int, pullUps: Int, squattings: Int)
tmp = myRecords
myRecords = myFriendsRecords
myFriendsRecords = tmp
myRecords
myFriendsRecords
myFriendsRecords = myRecords
myRecords = tmp

// Задание №3
let pushUpsDiff = myRecords.0 - myFriendsRecords.0
let pullUpsDiff = myRecords.pullUps - myFriendsRecords.pullUps
let squattingsDiff = myRecords.2 - myFriendsRecords.2
var ourDifference = (pushUps: pushUpsDiff, pullUps: pullUpsDiff, squattings: squattingsDiff)
