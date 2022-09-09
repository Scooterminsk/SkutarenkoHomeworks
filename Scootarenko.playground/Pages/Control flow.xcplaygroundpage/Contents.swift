//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Задание №1
let text = "An iOS developer is responsible for developing applications for mobile devices powered by Apple’s iOS operating system. [1] Ideally, a good iOS developer is proficient with one of the two programming languages for this platform: Objective-C or Swift. [2] If you are looking for a Swift developer specifically, please refer to our Swift Developer Job Description Template. [3] iOS developers must also have a strong understanding of the patterns and practices that revolve around the iOS platform. [4]"
var textAnalise = (vowels: 0, consonants: 0, numbers: 0, symbols: 0)
for i in text {
    switch i {
    case "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "Y":
        textAnalise.vowels += 1
    case "b"..."d", "f"..."h", "j"..."n", "p"..."t", "v"..."x", "z", "B"..."D", "F"..."H", "J"..."N", "P"..."T", "V"..."X", "Z":
        textAnalise.consonants += 1
    case "0"..."9":
        textAnalise.numbers += 1
    default:
        textAnalise.symbols += 1
    }
}
print("The analising text have \(textAnalise.vowels) vowels, \(textAnalise.consonants) consonants, \(textAnalise.numbers), numbers and \(textAnalise.symbols) symbols.")

// Задание №2
let age = 23
switch age {
case 0...6:
    print("This is a baby, he only may go to the kindergarden.")
case 7...18:
    print("He or she go to school.")
case 19...22:
    print("Very good years, this person go to university.")
case 23...60:
    print("Nice years are behind, it's time to go for a work and think about earning huge amounts of money.")
case 61...80:
    print("This person earned his retirement.")
case 81...100:
    print("It's very big fortune to live in those years.")
default:
    print("Ops, something goes wrong, try to write the correct age.")
}

// Задание №3
let student = (name: "Евгений", secondName: "Викторович", surname: "Кирилов")

switch student {
case (let name, _, _) where name.hasPrefix("А"):
    fallthrough
case (let name, _, _) where name.hasPrefix("О"):
    print("Поприветствуйте студенда по имени \(name)")
case (let name, let secondName, _) where secondName.hasPrefix("В"):
    fallthrough
case (let name, let secondName, _) where secondName.hasPrefix("Д"):
    print("Поприветствуйте студента, которого зовут \(name) \(secondName)")
case (_, _, let surname) where surname.hasPrefix("Е"):
    fallthrough
case (_, _, let surname) where surname.hasPrefix("З"):
    print("Поприветствуйте студента, фамилия которого \(surname)")
default:
    print("Поприветствуйте студента, которого зовут \(student.name) \(student.secondName) \(student.surname)")
}

// Задание №3
let firstShip = (x: 3...6, y: 7)
var firstShipHP = 4
let secondShip = (x: 5, y: 6)
var yourTurn = (x: Int.random(in: 1...10), y: Int.random(in: 1...10))

switch yourTurn {
case (firstShip.x, firstShip.y):
    if firstShipHP > 0 {
        print("You hit one of my ships!")
        firstShipHP -= 1
    } else {
        print("You killed my biggest ship!")
    }
case (secondShip.x, secondShip.y):
    print("Oh my god, you killed my smallest ship, crazy motherfucker")
default:
    print("Oops, you missed, try again later")
}
