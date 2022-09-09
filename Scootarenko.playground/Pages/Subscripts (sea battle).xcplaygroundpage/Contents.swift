//: [Previous](@previous)

import Foundation
import Darwin

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Create type "Ship" that will be a rectangle. It will have x, y - coordinate system (subscript). The ship will get shoots on coordinates and determine when it will be killed. Create x, y - field with ships on it and shoot on coordinaates. Make some misses and print all the information on the screen. */

struct Point {
    var x: Int
    var y: Int
}

struct Size {
    var width: Int
    var height: Int
}

struct Rect {
    var origin: Point
    var size: Size
    init(x: Int, y: Int, width: Int, height: Int) {
        origin = Point(x: x, y: y)
        size = Size(width: width, height: height)
    }
}

class Ship {
    enum DeckType: String {
        case wounded = "🔥"
        case killed = "💀"
        case live = "⚫"
    }
    
    let body: Rect
    var decksArray = [DeckType]()
    
    init(rect: Rect) {
        body = rect
        for _ in 0..<max(body.size.height, body.size.width) {
            decksArray += [.live]
        }
    }
    
    func isShipHasDeck(index: Int) -> Bool {
        return 0..<decksArray.count ~= index
    }
    
    func isDeath() -> Void {
        func killShip() -> Void {
            for i in 0..<decksArray.count {
                decksArray[i] = .killed
            }
        }
        for deck in decksArray {
            if deck == .live {
                return
            }
        }
        killShip()
    }
    
    func deckNumber(number: Int) -> Int {
        return number - 1
    }
    
    subscript(index: Int) -> DeckType? {
        get {
            return isShipHasDeck(index: deckNumber(number: index)) ? decksArray[deckNumber(number: index)] : nil
        }
        set {
            if isShipHasDeck(index: deckNumber(number: index)) {
                decksArray[deckNumber(number: index)] = newValue!
            }
            isDeath()
        }
    }
}

struct Battlefield {
    
    static let alphabet = Battlefield.createAlphabet()
    static let boardCell = "⬜"
    
    static func createAlphabet() -> String {
        let a = UnicodeScalar("A").value
        let z = UnicodeScalar("Z").value
        
        var abc = ""
        
        for c in a...z {
            abc += String(UnicodeScalar(c)!)
        }
        
        return abc
    }
    
    static func charToInt(char: Character) -> Int {
        
        let start = alphabet.startIndex
        let findValue = alphabet.firstIndex(of: char) ?? start
        
        return alphabet.distance(from: start, to: findValue) + 1
    }
    
    var boardArray = [[String]]()
    var shipsDict = [String : Ship]()
    let boardSize: Int
    var boardString = ""
    
    init(boardSize: Int) {
        self.boardSize = boardSize
        newGame()
        createBoardString()
    }
    
    mutating func createBoardString() -> Void {
        let endIndex = Battlefield.alphabet.index(Battlefield.alphabet.startIndex, offsetBy: boardSize)
        let tempString = Battlefield.alphabet.substring(to: endIndex)
        var tempString2 = "  "
        for (i,char) in tempString.enumerated() {
            tempString2 += " " + String(char)
        }
        boardString = tempString2
    }
    
    mutating func newGame() -> Void {
        boardArray = Array(repeating: Array(repeating: Battlefield.boardCell, count: boardSize), count: boardSize)
        printBoard()
    }
    
    mutating func updateBoard() -> Void {
        for key in shipsDict.keys {
            let deck = findDeckNumberAndCoordinateFromKey(key: key)
            let ship = shipsDict[key]!
            boardArray[deck.y!][deck.x!] = ship.decksArray[deck.deckNumber - 1].rawValue
            boardArray
        }
    }
    
    mutating func printBoard() -> Void {
        func printLineNumber(i: Int) -> Void {
            print(i < 9 ? "0\(i + 1)" : "\(i + 1)", terminator: "")
        }
        updateBoard()
        print(boardString)
        for (i,line) in boardArray.enumerated() {
            printLineNumber(i: i)
            for (i,cell) in line.enumerated() {
                print(cell, terminator: "")
            }
            printLineNumber(i: i)
            print("")
        }
        print(boardString + "\n")
    }
    func findDeckNumberAndCoordinateFromKey(key: String) -> (deckNumber: Int, x: Int?, y: Int?) {
        let ship = shipsDict[key]!
        var arr = [String]()
        for char in key {
            arr.append(String(char))
        }
        
        let x = Int(arr[0])
        let y = Int(arr[1])
        
        var deckNumber = 1
        if ship.body.size.width < ship.body.size.height {
            deckNumber += y! - ship.body.origin.y
        } else {
            deckNumber += x! - ship.body.origin.x
        }
        return (deckNumber, x, y)
    }
    
    mutating func putShipsFromShipsArray(shipsArray: [Ship]) -> Void {
        for ship in shipsArray {
            let rect = ship.body
            for i in 0..<rect.size.height {
                shipsDict["\(rect.origin.x)\(rect.origin.y + i)"] = ship
            }
            for i in 0..<rect.size.width {
                shipsDict["\(rect.origin.x + i)\(rect.origin.y)"] = ship
            }
        }
    }
    
    mutating func isShipInIndex(row: Int, line: Int) -> Ship.DeckType? {
        if boardArray[line][row] == Ship.DeckType.live.rawValue {
            let key = "\(row)\(line)"
            let ship = shipsDict[key]!
            let deck = findDeckNumberAndCoordinateFromKey(key: key)
            ship[deck.deckNumber] = .wounded
            return ship[deck.deckNumber]
        } else {
            print("\(returnCellName(row: row, line: line)) - MISS\n")
            boardArray[line][row] = "⭕"
        }
        return nil
    }
    
    func returnCellName(row: Int, line: Int) -> String {
        let a = UnicodeScalar("A").value
        let rowName = UnicodeScalar(row - 1 + Int(a))
        
        return ("\(rowName!)\(line)")
    }
    
    subscript(row: Character, line: Int) -> String? {
        mutating get {
            let rowIndex = Battlefield.charToInt(char: row)
            return self[rowIndex, line]
        }
    }
    
    subscript(row: Int, line: Int) -> String? {
        mutating get {
            if 1...boardSize ~= row && 1...boardSize ~= line {
                let rowIndex = row - 1
                let lineIndex = line - 1
            
                isShipInIndex(row: rowIndex, line: lineIndex)?.rawValue
            
                printBoard()
            
                return nil
            } else {
                print("Cell \(returnCellName(row: row, line: line)) is out of the board.\n")
                return nil
            }
        }
    }
}

var field = Battlefield(boardSize: 10)

let ship = Ship(rect: Rect(x: 1, y: 1, width: 1, height: 4))
let ship2 = Ship(rect: Rect(x: 5, y: 5, width: 1, height: 4))
let ship3 = Ship(rect: Rect(x: 7, y: 2, width: 3, height: 1))

var array = [ship, ship2, ship3]

field.putShipsFromShipsArray(shipsArray: array)
field.printBoard()

field["B", 8]
field["B", 2]
field["B", 4]
field[2, 5]
field["F", 6]
field["J", 3]
field[2, 6]
field["B", 3]
field[1, 20]
