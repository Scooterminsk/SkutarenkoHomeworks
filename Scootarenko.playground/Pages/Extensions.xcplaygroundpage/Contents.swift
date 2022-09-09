//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Create an extension for Int with the next properties: isNegative, isPositive, bool. */

/* MARK: Exercise #2. Add property, that will return count of numbers in Int. */

/* MARK: Exercise #3. Add subscript, that returns the symbol of the number using index. You can also create a setter, if you are professional. */


extension Int {
    //1
    var isPositive: Bool {
        return self >= 0
    }
    var isNegative: Bool {
        return self <= 0
    }
    var bool: Bool {
        return self != 0
    }
    
    //2
    var countNumbers: Int {
        return String(self).count
    }
    
    //3
    subscript(number: Int) -> Int? {
        get {
            let str = String(self).reversed().reversed()
            if number < 0 || number >= str.count {
                return nil
            }
            let index = str.index(str.startIndex, offsetBy: number)
            return Int(String(str[index]))!
        }
        set {
            var string = String(String(self).reversed().reversed())
            let index = string.index(string.startIndex, offsetBy: number)
            string.remove(at: index)
            string.insert(contentsOf: String(newValue!), at: index)
            self = Int(string)!
        }
    }
}

1.isPositive
1.isNegative
0.bool

1.countNumbers
212.countNumbers
212121.countNumbers

var number = 317

number[0]
number[1]
number[2]

number[0] = 5
number
number[1] = 4
number

/* MARK: Exercise #4. Extend String so that it will get subscript s[0..<3] and could also set values using this subscript. */

/* MARK: Exercise #5. Add String a method "truncate" that will cut extra symbols and if they will be, replace it by ellipsis. */

extension String {
    //4
    subscript(range: Range<Int>) -> String {
        get {
            let start = self.index(self.startIndex, offsetBy: range.startIndex)
            let end = self.index(start, offsetBy: range.endIndex)
            if range.endIndex > self.count {
                return String(self[start...])
            }
            return String(self[start..<end])
            }
        set {
            var strArr = self.reversed().reversed()
            let start = strArr.index(strArr.startIndex, offsetBy: range.startIndex)
            let end = strArr.index(start, offsetBy: range.endIndex)
            let new = newValue.reversed().reversed()
            if range.endIndex > self.count {
                strArr.removeSubrange(start...)
                strArr.insert(contentsOf: new, at: start)
                self = strArr
            } else {
                strArr.removeSubrange(start..<end)
                strArr.insert(contentsOf: new, at: start)
                self = strArr
            }
        }
    }
    //5
    func truncate(_ length: Int) -> String {
        if length < self.count {
            return self[0..<length] + "..."
            // return String(self[self.startIndex..<self.index(self.startIndex, offsetBy: length)]) + "..." - or like this, if we won't make the previous exercise.
        } else {
            return self
        }
    }
}

// let's check
var str = "Hello, world!"
str[2..<5]
str[2..<5] = "sss"
str

str.truncate(3)
str.truncate(50)

let s = "Hi hi hi"

s.truncate(4)
s.truncate(10)


