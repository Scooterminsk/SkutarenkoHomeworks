//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. We have a basic class "Artist". He has name and surname, and method "performance". Every artist must have his own performance: dancer will dance, singer will sing etc. For painter you should make a situation when he do something by his self and ignore what is initialised him (for example, he will change his name on artistic). When we call a method "performance", print name and surname of the artist and his performance. Then we should use polimorphism for artists. Append all of artists in the array and call their methods "performance" in for cycle. */

class Artist {
    var name: String
    var surname: String
    
    func performance() -> Void {
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

class Dancer: Artist {
    override func performance() -> Void {
        print("\(self.name) \(self.surname)\n* sounds of dance *")
    }
}

class Singer: Artist {
    override func performance() -> Void {
        print("\(self.name) \(self.surname)\n* sounds of beautiful song *")
    }
}

class Painter: Artist {
    override init(name: String, surname: String) {
        let arrOfName = ["Lukas", "Lu", "Luaz", "Pedro", "Pedrito", "Pedriccio"]
        let arrOfSurnames = ["Pedrovski", "Pedr", "Pedruliano", "Pidrito", "Pidriccelli"]
        super.init(name: arrOfName.randomElement()!, surname: arrOfSurnames.randomElement()!)
    }
    override func performance() -> Void {
        print("\(self.name) \(self.surname)\n* sounds of drawing ")
    }
}

var dancer = Dancer(name: "Danilo", surname: "Szmidt")
var singer = Singer(name: "Anna", surname: "Dombrowska")
var painter = Painter(name: "Alex", surname: "Turin")
painter.name
painter.surname

var arrOfArtists = [dancer, singer, painter]
for i in arrOfArtists {
    i.performance()
}

/* Create basic class "Vehicle" and append 3 different properties: speed, capacity and cost of one transportation (computed). Create several subclasses (plane, ship, helicopter, car, train) and redefine computed properties in them. Create 1 object of every class. + we must have a method that will count how much time and money will spend on transportation people from point A to B with help of our vehicles. Print the result (how fast we can make transportation, price, transportation count). Use polimorphism for this exercise. */

class Vehicle {
    var speed: Double {
        return 0
    }
    var capacity: Int {
        return 0
    }
    var cost: Double {
        return 0
    }
    
    func price(track: Double, count: Int) -> String {
        let intTrack = count > capacity ? Int(Double(count) / Double(capacity) * 2): 1
        let allTime: Double = track / speed * Double(intTrack)
        let time = String(format: "%.2f", allTime)
        let money = Double(count) * cost
        return "\(intTrack)\t\t\t\t\t\t: количество поездок туда и обратно.\n" +
        "\(time) часов \t\t\t: время, потраченное на передвижение.\n" +
        "\(money)$\t\t\t\t: стоимость этого передвижения."
    }
}

class Airplane: Vehicle {
    override var speed: Double {
        return 800
    }
    override var capacity: Int {
        return 50
    }
    override var cost: Double {
        200
    }
}

class Ship: Vehicle {
    override var speed: Double {
        return 50
    }
    override var capacity: Int {
        return 100
    }
    override var cost: Double {
        100
    }
}

class Car: Vehicle {
    override var speed: Double {
        return 100
    }
    override var capacity: Int {
        return 5
    }
    override var cost: Double {
        50
    }
}

class Helicopter: Vehicle {
    override var speed: Double {
        return 400
    }
    override var capacity: Int {
        return 3
    }
    override var cost: Double {
        500
    }
}

class Train: Vehicle {
    override var speed: Double {
        return 120
    }
    override var capacity: Int {
        return 200
    }
    override var cost: Double {
        100
    }
}

var airplane = Airplane()
var car = Car()
var ship = Ship()
var helicopter = Helicopter()
var train = Train()

var arrOfVehicles = [airplane, car, ship, helicopter, train]

for i in arrOfVehicles {
    print(i.price(track: 50, count: 100))
}

/* MARK: Exercise #3. There are 5 classes: humans, crocodiles, monkeys, dogs, giraffes. Our exercise is to create superclass that will group all this subclasses. Create several objects of every class. Count reptilian, quadruped, animals and alive creatures. */

class AnimalLife {
    var types = "Types"
    let haveBlood = true
    let canBreathe = true
    let canMove = true
    var feetNumber = 2
}

class Humans: AnimalLife {
    override var types: String {
        get {
            return super.types + ": Human"
        }
        set {}
    }
}

class Crocodiles: AnimalLife {
    let isReptilian = true
    override var types: String {
        get {
            return super.types + ": Crocodile"
        }
        set{}
    }
    override var feetNumber: Int {
        get {
            return super.feetNumber
        }
        set {
            super.feetNumber = 4
        }
    }
}

class Monkeys: AnimalLife {
    override var types: String {
        get {
            return super.types + ": Monkey"
        }
        set{}
    }
    override var feetNumber: Int {
        get {
            return super.feetNumber
        }
        set {
            super.feetNumber = 4
        }
    }
}

class Dogs: AnimalLife {
    override var types: String {
        get {
            return super.types + ": Dog"
        }
        set{}
    }
    override var feetNumber: Int {
        get {
            return super.feetNumber
        }
        set {
            super.feetNumber = 4
        }
    }
}

class Giraffes: AnimalLife {
    override var types: String {
        get {
            return super.types + ": Giraffe"
        }
        set{}
    }
    override var feetNumber: Int {
        get {
            return super.feetNumber
        }
        set {
            super.feetNumber = 4
        }
    }
}

var human1 = Humans()
var human2 = Humans()
var crocodile1 = Crocodiles()
var crocodile2 = Crocodiles()
var monkey1 = Monkeys()
var monkey2 = Monkeys()
var dog1 = Dogs()
var dog2 = Dogs()
var giraffe1 = Giraffes()
var giraffe2 = Giraffes()

let animalLife = [human1, human2, crocodile1, crocodile2, monkey1, monkey2, dog1, dog2, giraffe1, giraffe2]

let animals = animalLife.filter { $0 is Crocodiles || $0 is Monkeys || $0 is Dogs || $0 is Giraffes }
let reptilian = animalLife.filter { $0 is Crocodiles }
let quadruped = animalLife.filter { $0 is Crocodiles || $0 is Dogs || $0 is Giraffes }
let alive = animalLife.filter { $0.haveBlood }

func printArray(array: [AnimalLife], str: String) -> Void {
    print(str + " - count: \(array.count)")
    for item in array {
        print(item.types)
    }
    print("")
}

printArray(array: animals, str: "Animals")
printArray(array: reptilian, str: "Reptilian")
printArray(array: quadruped, str: "Quadruped")
printArray(array: alive, str: "Alive")
