//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Create type "Room". Room has width and height. Create type character. He has coordinates X and Y in the room. Make function that will show position of the character in the room (with help of text). */

/* MARK: Exercise #2. Give the character a method that will take an enum with cases: left, right, top and bottom. This method must move the character. Create a rule that will protect character from moving out of the room coordinates. */

/* MARK: Exercise #3. Create type "Box". The box has coordinate X and Y. The box also mustn't be moved out of the room coordinates. The box must be printed with the character in the common print method. */

/* MARK: Exercise #4. The character can move boxes, but without moving out of the room coordinates. */

/* MARK: Exercise #5. Add point, where we must move our boxes and move it :) */

// room structure
class Room {
    static let mapLevel = ["XXXXXXXX",
                           "X     XX",
                           "X0 #  XX",
                           "XXXX # X",
                           "X      X",
                           "X     @X",
                           "X 0  X X",
                           "XXXXXXXX"]
    
    static var width: Int { return mapLevel[0].count }
    static var height: Int { return mapLevel.count }
    
    static func array() -> [String] {
        var field = [String]()
        var tmp = ""
        for (idx, row) in mapLevel.enumerated() {
            for column in row {
                switch column {
                case "X":
                    tmp = " ⬛"
                case "0":
                    tmp = " ⭕"
                case "#":
                    tmp = Box.imageBox
                    Box.position.x = idx
                    Box.position.y = NSString(string: row).range(of: "#").location
                case "@":
                    tmp = Person.imagePerson
                    Person.position.x = idx
                    Person.position.y = NSString(string: row).range(of: "@").location
                default:
                    tmp = " ⬜"
                }
                field.append(tmp)
            }
        }
        return field
    }
    
    var field: [String] = Room.array()
    
    func printBorderField() -> Void {
        for row in 0..<Room.width {
            for column in 0..<Room.height {
                print(field[(row * Room.height) + column], terminator: "")
            }
            print("")
        }
        print("")
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return field[(row * Room.height) + column] != " ⬛"
    }
    
    func checkCollision(row: Int, column: Int) -> Bool {
        return field[(row * Room.height) + column] != Box.imageBox
    }
    
    subscript(row: Int, column: Int) -> String {
        get {
            return field[(row * Room.height) + column]
        }
        set {
            if indexIsValidForRow(row: row, column: column) {
                field[(row * Room.height) + column] = newValue
            }
        }
    }
}

// global function that checks direction
func switchDirection(dir: Direction, pos: inout Point) -> Void {
    
    func clear() -> Void {
        room[pos.x, pos.y] = " ⬜"
    }
    
    switch dir {
    case .Up:
        if room.indexIsValidForRow(row: pos.x - 1, column: pos.y) {
            if room.checkCollision(row: pos.x - 1, column: pos.y) {
                clear()
                pos.x -= 1
            } else if room.indexIsValidForRow(row: pos.x - 2, column: pos.y) {
                Box.moveBox(dir: dir, room: room, pos: Point(x: pos.x - 1, y: pos.y))
                clear()
                pos.x -= 1
            }
        }
    case .Down:
        if room.indexIsValidForRow(row: pos.x + 1, column: pos.y) {
            if room.checkCollision(row: pos.x + 1, column: pos.y) {
                clear()
                pos.x += 1
            } else if room.indexIsValidForRow(row: pos.x + 2, column: pos.y) {
                Box.moveBox(dir: dir, room: room, pos: Point(x: pos.x + 1, y: pos.y))
                clear()
                pos.x += 1
            }
        }
    case .Left:
        if room.indexIsValidForRow(row: pos.x, column: pos.y - 1) {
            if room.checkCollision(row: pos.x, column: pos.y - 1) {
                clear()
                pos.y -= 1
            } else if room.indexIsValidForRow(row: pos.x, column: pos.y - 2) {
                Box.moveBox(dir: dir, room: room, pos: Point(x: pos.x, y: pos.y - 1))
                clear()
                pos.y -= 1
            }
        }
    case .Right:
        if room.indexIsValidForRow(row: pos.x, column: pos.y + 1) {
            if room.checkCollision(row: pos.x, column: pos.y + 1) {
                clear()
                pos.y += 1
            } else if room.indexIsValidForRow(row: pos.x, column: pos.y + 2) {
                Box.moveBox(dir: dir, room: room, pos: Point(x: pos.x, y: pos.y + 1))
                clear()
                pos.y += 1
            }
        }
    }
}
// global structure "Point" and enumeration "Direction"
struct Point {
    var x: Int
    var y: Int
    
    mutating func moveByX(x: Int, byY y: Int) {
        self.x += x
        self.y += y
    }
}
enum Direction {
    case Up
    case Down
    case Right
    case Left
}

// character structure
struct Person {
    // we are using type properties, because we have only one character on map
    static let imagePerson = " 🤠"
    static var position = Point(x: 0, y: 0)
    mutating func movePerson(dir: Direction, room: Room) -> Void {
        switchDirection(dir: dir, pos: &Person.position)
        room[Person.position.x, Person.position.y] = Person.imagePerson
    }
}
// abstract box model
struct Box {
    static let imageBox = " 📦"
    static var position = Point(x: 0, y: 0)
    static func moveBox(dir: Direction, room: Room, pos: Point) -> Void {
        var pos = pos
        switchDirection(dir: dir, pos: &pos)
        room[pos.x, pos.y] = Box.imageBox
    }
}

// let's create map and character
var room = Room()
var cowboy = Person()

// print level
room.printBorderField()

// let's play now
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Left, room: room)
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Left, room: room)
cowboy.movePerson(dir: .Down, room: room)
cowboy.movePerson(dir: .Down, room: room)
cowboy.movePerson(dir: .Right, room: room)
cowboy.movePerson(dir: .Down, room: room)
cowboy.movePerson(dir: .Left, room: room)
cowboy.movePerson(dir: .Left, room: room)
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Left, room: room)
cowboy.movePerson(dir: .Down, room: room)
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Right, room: room)
cowboy.movePerson(dir: .Right, room: room)
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Up, room: room)
cowboy.movePerson(dir: .Left, room: room)
cowboy.movePerson(dir: .Left, room: room)
room.printBorderField()
