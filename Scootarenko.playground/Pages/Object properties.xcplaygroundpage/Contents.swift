//: [Previous](@previous)

import Foundation
import Darwin

var greeting = "Hello, playground"

//: [Next](@next)

// MARK: Exercise #1. Repeat all the code from Alex's lesson about object properties.

/* MARK: Exercise #2. Extend student with new structure "date of birth" that will have 3 stored properties (day, month, year) and 2 computed properties. The first will count student's age and the second will count how many years did he study (from 6 years). If student is younger than 6 years old, print about that and make years of study equal to 0. */
struct DateOFBirth {
    var day: UInt
    var month: UInt
    var year: UInt
    
    func getAge() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let dateArray = formatter.string(from: date).split(separator: ".").map {
            Int($0) ?? 0
        }
        
        var age = dateArray[2] - Int(year)
        
        if dateArray[1] < Int(month) {
            age -= 1
        } else if dateArray[1] == Int(month) && dateArray[0] < Int(day) {
            age -= 1
        }
        return age
    }
}

struct Student {
    var firstName: String {
       willSet {
            print("Will set " + newValue + " instead of " + firstName)
        }
        didSet {
            print("Did set " + firstName + " instead of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    var secondName: String {
        willSet {
             print("Will set " + newValue + " instead of " + secondName)
         }
        didSet {
            print("Did set " + secondName + " instead of " + oldValue)
            secondName = secondName.capitalized
        }
    }
    var fullName: String {
        get {
            return firstName + " " + secondName
        }
        set {
            print("Full name trying to be changed to \(newValue)")
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                secondName = words[1]
            }
        }
    }
    var dateOfBirth: DateOFBirth
    
    var age: Int {
        return dateOfBirth.getAge()
    }
    
    var hasStudied: Int {
        return age > 6 ? age - 6: 0
    }
    
}

var student = Student(firstName: "Eugene", secondName: "Kirilov", dateOfBirth: DateOFBirth(day: 22, month: 4, year: 1999))
student.firstName = "SAM"
student.firstName
student.fullName
student.fullName = "Kirilito Maksimiliano"
student.fullName
student.age
student.hasStudied

/* MARK: Exercise #3. Create structure "vector", that contains two internal structures "points" (A and B stored properties). You should also add 2 computed properties (middle of vector and lenght, that you will count with help of math functions) */

/* MARK: Exercise #4. If the middle of the vector changes, will change coordinates of point A and B. If length changes, coordinates of point B will change. */

struct Vector {
    
    struct Point {
        var x: Float
        var y: Float
    }
    
    var pointA : Point
    var pointB: Point
    
    var middlePoint: Point {
        get {
            let middlePointX = (pointB.x - pointA.x) / 2
            let middlePointY = (pointB.x - pointA.x) / 2
            
            return Point(x: middlePointX, y: middlePointY)
        }
        set {
            let vectorX = (newValue.x - middlePoint.x) / 2
            let vectorY = (newValue.y - middlePoint.y) / 2
            
            pointA.x += vectorX
            pointA.y += vectorY
            
            pointB.x += vectorX
            pointB.y += vectorY
        }
    }
    
    var length: Float {
        get {
            return sqrt(pow(pointB.x - pointA.x, 2) + pow(pointB.y - pointA.y, 2))
        }
        set {
            pointB.x = pointA.x + newValue * (pointB.x - pointA.x) / length
            pointB.y = pointA.y + newValue * (pointB.y - pointA.y) / length
        }
    }
}

// let's check
var vector = Vector(pointA: Vector.Point(x: 5.0, y: 5.0), pointB: Vector.Point(x: 5.0, y: 15.0))
vector.pointA
vector.pointB
vector.middlePoint
print(vector.middlePoint)
vector.length

vector.middlePoint = Vector.Point(x: 15.0, y: 15.0)
print(vector.pointA)
print(vector.pointB)
print(vector.middlePoint)
vector.length

vector.length = 20
print(vector.pointA)
print(vector.pointB)
vector.length
