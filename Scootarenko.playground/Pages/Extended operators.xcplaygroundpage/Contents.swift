//: [Previous](@previous)

import Foundation
import Darwin

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Overload next operators: -, -=, *, *=, /, /=, decrement -- (prefix and postfix) for points. */

/* MARK: Exercise #2. Add structure "Size" with width and height. Create structure "Rect", that will contains point and size. Overload operators + and - to add or subtract rectangles. */

/* MARK: Exercise #3. Overload operator + for string, so that it will append numbers to input String. Make unique operator that do next: if 2 strings are equal, make them capitalized. */

// 1
struct Point {
    var x: Int
    var y: Int
}

func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}

func -= (a: inout Point, b: Point) -> Void {
    a = Point(x: a.x - b.x, y: a.y - b.y)
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}

func *= (a: inout Point, b: Point) -> Void {
    a = Point(x: a.x * b.x, y: a.y * b.y)
}

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}

func /= (a: inout Point, b: Point) -> Void {
    a = Point(x: a.x / b.x, y: a.y / b.y)
}

prefix func -- (a: inout Point) -> Point {
    a.x -= 1
    a.y -= 1
    return a
}

postfix func -- (a: inout Point) -> Point {
    let b = a
    --a
    return b
}

var a = Point(x: 4, y: 5)
var b = Point(x: 1, y: 2)

// 2
struct Size {
    var height: Int
    var width: Int
}

struct Rectangle {
    var startPoint: Point
    var size: Size
}

func + (a: Rectangle, b: Rectangle) -> Rectangle {
    return Rectangle(startPoint: a.startPoint, size: Size(height: a.size.height + b.size.height, width: a.size.width + b.size.width))
}

func += (a: inout Rectangle, b: Rectangle) -> Void {
    a = Rectangle(startPoint: a.startPoint, size: Size(height: a.size.height + b.size.height, width: a.size.width + b.size.width))
}

func - (a: Rectangle, b: Rectangle) -> Rectangle {
    return Rectangle(startPoint: a.startPoint, size: Size(height: a.size.height - b.size.height, width: a.size.width - b.size.width))
}

func -= (a: inout Rectangle, b: Rectangle) -> Void {
    a = Rectangle(startPoint: a.startPoint, size: Size(height: a.size.height - b.size.height, width: a.size.width - b.size.width))
}

var z = Rectangle(startPoint: Point(x: 2, y: 5), size: Size(height: 5, width: 8))
var x = Rectangle(startPoint: Point(x: 3, y: 3), size: Size(height: 2, width: 1))
var v = Rectangle(startPoint: Point(x: 9, y: 2), size: Size(height: 3, width: 3))
var u = Rectangle(startPoint: Point(x: 1, y: 1), size: Size(height: 1, width: 1))

var p = z + x
print(p)
var m = v - u
print(m)
z += x
print(z)
v -= u
print(v)

// 3/1
func + (a: String, b: Int) -> String {
    return a + String(b)
}

func + (a: Int, b: String) -> String {
    return String(a) + b
}

var str = "Eugene"
var num = 1

let result = str + num
let result1 = num + str

// 3/2
infix operator %%: ComparisonPrecedence

func %% (a: inout String, b: inout String) {
    var arr1 = [String]()
    var arr2 = [String]()
    
    for i in a {
        arr1.append(String(i))
    }
    for j in b {
        arr2.append(String(j))
    }
    
    var index = 0
    for i in arr1 {
        if i == arr2[index] {
            arr1[index] = i.capitalized
            arr2[index] = arr2[index].capitalized
            index += 1
        } else {
            index += 1
        }
    }
    
    a = arr1.joined()
    b = arr2.joined()
}

// let's check
var str1 = "ankto"
var str2 = "tnksp"

str1 %% str2
str1
str2
