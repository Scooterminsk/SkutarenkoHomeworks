//: [Previous](@previous)

import Foundation
import libkern

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Create structure that will be called "Student". Add properties to this structure: name, surname, year of birth, average mark. Make some instances of this structure and fill it with data. Then append them to the new array. */
struct StudentStruct {
    let name: String
    let surname: String
    let yearOfBirth: UInt
    let averageMark: Double
}
let stud1 = StudentStruct(name: "Eugene", surname: "Kirilov", yearOfBirth: 1999, averageMark: 10.0)
let stud2 = StudentStruct(name: "Kirill", surname: "Maximov", yearOfBirth: 1996, averageMark: 9.5)
let stud3 = StudentStruct(name: "Alex", surname: "Leshchenia", yearOfBirth: 1991, averageMark: 9.2)
let stud4 = StudentStruct(name: "Yan", surname: "Aniskovich", yearOfBirth: 1999, averageMark: 9.0)
let stud5 = StudentStruct(name: "Andrew", surname: "White", yearOfBirth: 2000, averageMark: 5.3)
let stud6 = StudentStruct(name: "Maxim", surname: "Kirilov", yearOfBirth: 2003, averageMark: 6.2)

var arrOfStuds = [stud1, stud2, stud3, stud4, stud5, stud6]

// MARK: Exercise #2. Write function that has array of students as an input parameter and print information about them with enumeration.
func studInfo(arr: [StudentStruct]) -> Void {
    for (number, stud) in arr.enumerated() {
        print("Info about student #\(number + 1): \(stud.name) \(stud.surname), year of birth: \(stud.yearOfBirth), average mark: \(stud.averageMark)")
    }
}
studInfo(arr: arrOfStuds)
print("")

// MARK: Exercise #3. Sort the array with help of "sorted" function by average mark.
let arrOfStudsSortesByMarks = arrOfStuds.sorted { $0.averageMark > $1.averageMark }
studInfo(arr: arrOfStudsSortesByMarks)
print("")

// MARK: Exercise #4. Sort the array by surnames and if surnames are equal, compare elements of the array by names.
let arrOfStudsSortedBySurnames = arrOfStuds.sorted { ($0.surname == $1.surname) ? $0.name < $1.name: $0.surname < $1.surname }
studInfo(arr: arrOfStudsSortedBySurnames)
print("")

/* MARK: Exercise #5. Create new variable and initialize unsortes array of students to it. Then change data of all students in the new array. Look if data in previous array will change. */
var newArrOfStuds = arrOfStuds
newArrOfStuds[0] = StudentStruct(name: "Pavel", surname: "Antipov", yearOfBirth: 1998, averageMark: 8.5)
newArrOfStuds[1] = StudentStruct(name: "Viktor", surname: "Pavlov", yearOfBirth: 1995, averageMark: 7.8)
newArrOfStuds[2] = StudentStruct(name: "Innokentiy", surname: "Kvintov", yearOfBirth: 1999, averageMark: 9.3)
newArrOfStuds[3] = StudentStruct(name: "Nikita", surname: "Kistanov", yearOfBirth: 1991, averageMark: 6.2)
newArrOfStuds[4] = StudentStruct(name: "Konstantin", surname: "Aiplatov", yearOfBirth: 2000, averageMark: 8.2)
newArrOfStuds[5] = StudentStruct(name: "Alex", surname: "Scootarenko", yearOfBirth: 1989, averageMark: 10.0)

studInfo(arr: arrOfStuds)
print("")
studInfo(arr: newArrOfStuds)
print("")
// As we can see, there are no changes in the first array of studs, because structures have value type.

/* MARK: Exercise #6. Repeat all exercises above, but using classes. */
class StudentClass {
    var name: String
    var surname: String
    var yearOfBirth: UInt
    var averageMark: Double
    
    init(name: String, surname: String, yearOfBirth: UInt, averageMark: Double) {
        self.name = name
        self.surname = surname
        self.yearOfBirth = yearOfBirth
        self.averageMark = averageMark
    }
}
var stud1c = StudentClass(name: "Eugene", surname: "Kirilov", yearOfBirth: 1999, averageMark: 10.0)
var stud2c = StudentClass(name: "Kirill", surname: "Maximov", yearOfBirth: 1996, averageMark: 9.5)
var stud3c = StudentClass(name: "Alex", surname: "Leshchenia", yearOfBirth: 1991, averageMark: 9.2)
var stud4c = StudentClass(name: "Yan", surname: "Aniskovich", yearOfBirth: 1999, averageMark: 9.0)
var stud5c = StudentClass(name: "Andrew", surname: "White", yearOfBirth: 2000, averageMark: 5.3)
var stud6c = StudentClass(name: "Maxim", surname: "Kirilov", yearOfBirth: 2003, averageMark: 6.2)

var arrOfStudsClass = [stud1c, stud2c, stud3c, stud4c, stud5c, stud6c]

// function that prints information about students
func studInfo(arr: [StudentClass]) -> Void {
    for (number, stud) in arr.enumerated() {
        print("Info about student #\(number + 1): \(stud.name) \(stud.surname), year of birth: \(stud.yearOfBirth), average mark: \(stud.averageMark)")
    }
}
studInfo(arr: arrOfStudsClass)
print("")

// Sort the array with help of "sorted" function by average mark.
let arrOfStudsSortesByMarksC = arrOfStudsClass.sorted { $0.averageMark > $1.averageMark }
studInfo(arr: arrOfStudsSortesByMarksC)
print("")

// Sort the array by surnames and if surnames are equal, compare elements of the array by names.
let arrOfStudsSortedBySurnamesC = arrOfStudsClass.sorted { ($0.surname == $1.surname) ? $0.name < $1.name: $0.surname < $1.surname }
studInfo(arr: arrOfStudsSortedBySurnamesC)
print("")

/* Create new variable and initialize unsortes array of students to it. Then change data of all students in the new array. Look if data in previous array will change. */
var newArrOfStudsC = arrOfStudsClass
newArrOfStudsC[0].name = "Pavel"
newArrOfStudsC[1].surname = "Pavlov"
newArrOfStudsC[2].yearOfBirth = 1999
newArrOfStudsC[3].averageMark = 6.2
newArrOfStudsC[4].name = "Konstantin"
newArrOfStudsC[5].surname = "Scootarenko"

studInfo(arr: newArrOfStudsC)
print("")
studInfo(arr: arrOfStudsClass)
print("")

