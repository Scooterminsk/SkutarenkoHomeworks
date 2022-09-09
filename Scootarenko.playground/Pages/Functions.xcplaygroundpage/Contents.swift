//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Exercise #1

func lickBoy() -> String {
    return "\u{1F60B} "
}

func crazyBoy() -> String {
    return "\u{1F92A} "
}

func keepSilenceBoy() -> String {
    return "\u{1F92B} "
}

func assWeCan() -> String {
    return "\u{1F351} "
}

func bigBoi() -> String {
    return "\u{1F346} "
}

print(lickBoy() + crazyBoy() + keepSilenceBoy() + assWeCan() + bigBoi())

// Exercise #2
func chessCell(forLetter l: String, forNum n: Int) -> String {
    guard ("A"..."H").contains(l) else {
        return "Attention! Please use letters from A to H"
    }
    guard (1...8).contains(n) else {
        return "Attention! Please use numbers from 1 to 8"
    }
    let abc = "ABCDEFGH"
    var letterPosition = 1
    for i in abc {
        if l != String(i) {
            letterPosition += 1
        } else {
            break
        }
    }
    return (letterPosition % 2 == n % 2) ? "black" : "white"
}

// check this new function
chessCell(forLetter: "A", forNum: 8)
chessCell(forLetter: "v", forNum: 3)
chessCell(forLetter: "B", forNum: 4)

// Exercise #3
// function to reverse an Int array
func reverseIntArr(forArr: [Int]) -> [Int] {
    var result = [Int]()
    for i in forArr {
        result.insert(i, at: 0)
    }
    return result
}
// check the last function
reverseIntArr(forArr: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

// function to reverse a String array (overload)
func reverseArr(forArr: [String]) -> [String] {
    var result = [String]()
    for i in forArr {
        result.insert(i, at: 0)
    }
    return result
}
// check the last function
reverseArr(forArr: ["Hello", "bro", "how", "are", "you"])

// creating function to transform sequence to Int array (also using overload)
func reverseArr(forSequence: Int...) -> [Int] {
    reverseIntArr(forArr: forSequence)
}
// check the last function
reverseArr(forSequence: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

// Exercise #4
// function to reverse an Int array with help of inouts (also using overload)
func reverseArr(forArr: inout [Int]) -> Void {
    for i in forArr {
        forArr.insert(i, at: 0)
    }
}
// check of the last function
var intArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
reverseArr(forArr: &intArr)
intArr

// function to reverse a String array with help of inouts (also using overload)
func reverseArr(forArr: inout [String]) -> Void{
    for i in forArr {
        forArr.insert(i, at: 0)
    }
}
// check of the last function
var stringArr = ["yo", "dogs", "I'm", "Naruto", "Uzumaki"]
reverseArr(forArr: &stringArr)

// Exercise #5
/* creating function to update russian and english texts with the next rules: consonants must be lowercased, vowels must be uppercased, numbers should be transformed for instance from 0 to zero etcetera, punctuation marks must be removed*/
func stringUpdate(forString: String) -> String {
    let arrOfNumbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var result = ""
    for char in forString.lowercased() {
        let char = String(char)
        switch char {
        case "0"..."9":
            result += arrOfNumbers[Int(char)!]
        case "б"..."д", "ж", "з", "й"..."н", "п"..."т", "ф"..."ъ", "ь":
            result += char
        case "b"..."d", "f"..."h", "j"..."n", "p"..."t", "v"..."x", "z":
            result += char
        case "а", "е", "ё", "и", "о", "у", "ы", "э", "ю", "я":
            result += char.uppercased()
        case "a", "e", "i", "o", "u", "y":
            result += char.uppercased()
        case " ":
            result += " "
        default:
            result += ""
        }
    }
    return result
}
// checking the last function on russian text
var randomRusText = "Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)"
print(stringUpdate(forString: randomRusText))
// checking the last function on english text
var randomEngText = "The earliest forms of English, evolved from a group of West Germanic (Ingvaeonic) dialects brought to Great Britain by Anglo-Saxon settlers in the 5th century and further mutated by Norse-speaking Viking settlers starting in the 8th and 9th centuries, are collectively called Old English."
print(stringUpdate(forString: randomEngText))
