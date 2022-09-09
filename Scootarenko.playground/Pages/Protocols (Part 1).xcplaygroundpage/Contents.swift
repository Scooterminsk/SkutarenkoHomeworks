//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Create protocol "Food", that will have name (only get) and method taste (it will print your feelings about current food). Create array of different food (different classes, but all of them signed on protocol "Food". Print method of every product and sort an array by name.  */

/* MARK: Exercise #2. Create protocol "Storable" that will be inhereted from protocol "Food". Then sign some of food to this new protocol and get them from array to fridge. Add bool property "Expired" and check it before moving food to fridge. If it is storable, but expired, move this product to trash. */

/* MARK: Exercise #3. Add property "daysToExpire" to "Storable" protocol. Sort products in the fridge by this new property. If daysToExpire will be equal for 2 product, sort it by name also. */

/* MARK: Exercise #4. Delete inheritance of protocol "Food" to protocol "Storable". Now in the fridge must be products that suscribed to both protocols. */

protocol Food {
    var name: String { get }
    func taste() -> Void
}

protocol Storable {
    var expired: Bool { get }
    var daysToExpire: Int { get }
}

class Milk: Storable {
    var name = "milk"
    var expired = false
    var daysToExpire = 5
    func taste() -> Void {
        print("This milk is so tasty!")
    }
}
extension Milk: Food {}

class Bread: Storable {
    var name = "bread"
    var expired = false
    var daysToExpire = 3
    func taste() -> Void {
        print("This bread is so tasty!")
    }
}
extension Bread: Food {}

class SourCream: Storable {
    var name = "sour cream"
    var expired = true
    var daysToExpire = 0
    func taste() -> Void {
        print("This sour cream is so tasty!")
    }
}
extension SourCream: Food {}

class Yogurt: Storable {
    var name = "yogurt"
    var expired = false
    var daysToExpire = 10
    func taste() -> Void {
        print("This yogurt is so tasty!")
    }
}
extension Yogurt: Food {}

class Meat: Storable {
    var name = "meat"
    var expired = false
    var daysToExpire = 4
    func taste() -> Void {
        print("This meat is so tasty!")
    }
}
extension Meat: Food {}

class Fish: Storable {
    var name = "fish"
    var expired = true
    var daysToExpire = 0
    func taste() -> Void {
        print("This fish is so tasty!")
    }
}
extension Fish: Food {}

class Butter: Storable {
    var name = "butter"
    var expired = false
    var daysToExpire = 20
    func taste() -> Void {
        print("This butter is so tasty!")
    }
}
extension Butter: Food {}

class Tomatoes: Storable {
    var name = "tomatoes"
    var expired = false
    var daysToExpire = 2
    func taste() -> Void {
        print("This tomatoes is so tasty!")
    }
}
extension Tomatoes: Food {}

class Cucumbers: Storable {
    var name = "cucumbers"
    var expired = false
    var daysToExpire = 4
    func taste() -> Void {
        print("This cucumbers is so tasty!")
    }
}
extension Cucumbers: Food {}

class Eggs: Storable {
    var name = "eggs"
    var expired = false
    var daysToExpire = 10
    func taste() -> Void {
        print("This eggs is so tasty!")
    }
}
extension Eggs: Food {}

class Carrot: Storable {
    var name = "carrot"
    var expired = false
    var daysToExpire = 11
    func taste() -> Void {
        print("This carrot is so tasty!")
    }
}
extension Carrot: Food {}

class Potatoes: Storable {
    var name = "potatoes"
    var expired = false
    var daysToExpire = 20
    func taste() -> Void {
        print("This potatoes is so tasty!")
    }
}
extension Potatoes: Food {}

class Cheese: Storable {
    var name = "cheese"
    var expired = false
    var daysToExpire = 30
    func taste() -> Void {
        print("This cheese is so tasty!")
    }
}
extension Cheese: Food {}

class Chocolate: Storable {
    var name = "chocolate"
    var expired = false
    var daysToExpire = 50
    func taste() -> Void {
        print("This chocolate is so tasty!")
    }
}
extension Chocolate: Food {}

class Bananas: Storable {
    var name = "bananas"
    var expired = false
    var daysToExpire = 7
    func taste() -> Void {
        print("This bananas is so tasty!")
    }
}
extension Bananas: Food {}

var shopBag: Array<Storable & Food> = [Milk(), Bread(), SourCream(), Yogurt(), Meat(), Fish(), Butter(), Tomatoes(), Cucumbers(), Eggs(), Carrot(), Potatoes(), Cheese(), Chocolate(), Bananas()]
shopBag.sort{ $0.name < $1.name }

var trashBucket = Array<Storable & Food>()
var fridge = Array<Storable & Food>()

for i in shopBag {
    i.taste()
    if i.expired {
        trashBucket.append(i)
    } else if !i.expired {
        fridge.append(i)
    } else {
        continue
    }
}

fridge.sort{ s1, s2 in
    if s1.daysToExpire == s2.daysToExpire {
        return s1.name < s2.name
    } else {
        return s1.daysToExpire < s2.daysToExpire
    }
}

fridge
