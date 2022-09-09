//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: There is a family: dad, mom and kids. Dad is main in the family, mom controls kids, so the next hierarchy: dad - mom - kids. Kids are on the same level of hierarchy. Kids may call each other and they may search ways how to talk to other kids, for instance, speak: "Give me the toy", ask mom: "Mom, give me a candy please", talk to dad: "Dad, buy me this toy, please". All this hierarchy lays in the object of the class "Family", that has methods, for instance, "Print all family", that is the method returns an array of all family members. Dad has 3 closures: 1. When he appeals to the family - print family. 2. Print mom. 3. Print all kids. Create all the hierarchy with connections. When will be an exet out of scope, all objects must be destroyed. */


class Family {
    var father: Father
    var mother: Mother
    var children: [Child]?
    
    init(father: Father, mother: Mother, children: [Child]?) {
        self.father = father
        self.mother = mother
        
        self.mother.children = children
        self.father.wife = mother
        self.mother.husband = father
        self.father.family = self
        self.children = children
        
        if let children = self.children {
            for i in children {
                i.mother = mother
                i.father = father
            }
        }
    }
    
    func printChild() -> String {
        var text = ""
        if let kids = children {
            for i in kids.indices {
                text += "kid \(i + 1): \(kids[i].name)\n"
            }
        } else {
            text += "family doesn't have children"
        }
        return text
    }
    func description() -> Void {
        print("""
father: \(father.name)
mother: \(mother.name)
children: \(printChild())
""")
    }
    
    deinit {
        print("Family deinitialized.")
    }
}

class Father {
    var name: String
    weak var family: Family?
    var wife: Mother?
    
    init(name: String) {
        self.name = name
    }
    
    lazy var printFamily: () -> Void = { [unowned self] in
        self.family!.description()
    }
    
    lazy var talkWife: () -> Void = { [unowned self] in
        print(self.wife!.name)
    }
    
    lazy var myChildren: () -> Void = { [unowned self] in
        print(self.family!.printChild())
    }
    
    func buyToy() -> Void {
        print("I will buy a new toy tomorrow!")
    }
    
    deinit {
        print("Father \(name) deinitialized.")
    }
}

class Mother {
    var name: String
    weak var husband: Father?
    var children: [Child]?
    
    init(name: String) {
        self.name = name
    }
    
    func giveSweet() -> Void {
        print("Here is your sweet babe.")
    }
    
    deinit {
        print("Mother \(name) deinitialized.")
    }
}

class Child {
    var name: String
    weak var father: Father!
    weak var mother: Mother!
    
    var broSis: [Child]? {
        let kid = mother.children?.filter { $0.name != self.name }
        return kid
    }
    
    init(name: String) {
        self.name = name
    }
    
    func toAskToy() -> Void {
        print("\(name) to ask: Father, buy me this toy, please!")
        self.father.buyToy()
    }
    
    func toAskCandy() -> Void {
        print("\(name) to ask: Mother, give me a sweet, please!")
        self.mother.giveSweet()
    }
    
    func toPushRelative() -> Void {
        if let relative = broSis {
            let random = Int.random(in: 0...relative.count - 1)
            print("\(name) to ask: \(relative[random].name), give me a toy!")
        }
    }
    
    func toAskSomebody() -> Void {
        print("\(name) to ask somebody.")
    }
    
    deinit {
        print("Child \(name) deinitialized.")
    }
}
let playGround = true
if playGround {
    let family = Family(father: Father(name: "Bobby"), mother: Mother(name: "Stefanie"), children: [Child(name: "Boris"), Child(name: "Mark"), Child(name: "Pipo")])
    
    family.description()
    print("")
    family.father.printFamily()
    print("")
    family.father.talkWife()
    print("")
    family.father.myChildren()
    print("")
    if let kids = family.children {
        for i in kids {
            i.toAskToy()
            i.toAskCandy()
            i.toPushRelative()
            i.toAskSomebody()
            print("")
        }
    }
}
