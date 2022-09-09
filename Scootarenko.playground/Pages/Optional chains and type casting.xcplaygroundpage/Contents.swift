//: [Previous](@previous)

import Foundation
import Security

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise. Create class "Human". It will have the next properties: father, mother, brothers, sisters (all optionals). Create about 30 people, get one of them, give him father/mother. Give father/mother/brothers/sisters to father and mother. We will have a big hierarchy-tree. Then you should count, how many cousins, second cousins, uncles he has. All sisters, mothers should be objects of class "Woman", fathers, brothers should be objects of class "Man". Create method "Move sofa" for man and "Instruct to move sofa" for woman. All must work as usual. Append all people to the arrray "Family", analize the array and count men and women, for every man call the method "Move sofa", for every woman call the method "Instruct to move sofa". Extend class "Human", he will have a new property "pet". Pets may be different (parrets, dogs, cats etc.), it can be many pets, or can be no pets. Give several people pets. Analize the array of people. Check every person, if he has a pet, append all pet to the array of pets. Count how many pets of every species are in those array. All the pets must be inhereted from class "Animal". Every animal must have a method "Give voice" and every subclass must override this method. When we analize the array of pets, every pet must give voice. For this exercise you should use optional chaining and type casting. */

class Human {
    
    var dad: Male?
    var mom: Female?
    var bros: [Male]?
    var sisters: [Female]?
    var pets: [Pet]?
    
}

class Male: Human {
    func move() -> Void {
        print("I moving the coach!")
    }
}

class Female: Human {
    func askAMan() -> Void {
        print("Please, move the coach!")
    }
}

class Pet {
    func voice() -> Void {}
}

class Cat: Pet {
    override func voice() {
        print("Meow")
    }
}

class Dog: Pet {
    override func voice() {
        print("Woof")
    }
}

func generate() -> (Male, [Human]) {
    
    let males = [Male(), Male(), Male(), Male(), Male()]
    let females = [Female(), Female(), Female(), Female(), Female(), Female()]
    
    let human = males[4]
    
    human.dad = males[0]
    human.mom = females[0]
    
    // uncles
    human.mom?.bros = [males[1], males[2]]
    
    // aunts
    human.mom?.sisters = [females[1]]
    human.dad?.sisters = [females[2], females[3], females[4]]
    
    // granddad
    human.dad?.dad = males[3]
    
    // grandmother
    human.mom?.mom = females[5]
    
    // pets
    human.dad?.pets = [Dog()]
    human.mom?.pets = [Cat(), Dog()]
    
    return (human, males as [Human] + females)
}

let (human, humans) = generate()

var count = (aunts: 0, uncles: 0, males: 0, females: 0, dogs: 0, cats: 0)

count.uncles += human.mom?.bros?.count ?? 0
count.aunts += human.mom?.sisters?.count ?? 0
count.aunts += human.dad?.sisters?.count ?? 0

for human in humans {
    if let human = human as? Male {
        count.males += 1
        human.move()
    } else if let human = human as? Female {
        count.females += 1
        human.askAMan()
    }
}
print("")
for human in humans {
    if human.pets == nil {
        continue
    }
    for pet in human.pets! {
        switch pet {
        case is Dog:
            count.dogs += 1
            pet.voice()
        case is Cat:
            count.cats += 1
            pet.voice()
        default: break
        }
    }
}

print("\nOur network contains - aunts: \(count.aunts), uncles: \(count.uncles), males: \(count.males), females: \(count.females), dogs: \(count.dogs), cats: \(count.cats)")
