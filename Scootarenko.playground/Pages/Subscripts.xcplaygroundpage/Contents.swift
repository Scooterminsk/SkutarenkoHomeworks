//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Create type "Chessboard". Add subscript that will return color of cell by its coordinate (letter and number). If user makes mistake with coordinates, return nil. */

struct Chessboard {
    subscript(letter: String, number: Int) -> String? {
        let letterArr = ["a", "b", "c", "d", "e", "f", "g", "h"]
        if letterArr.contains(letter.lowercased()) && (1...8) ~= number {
            return (letterArr.firstIndex(of: letter.lowercased())! % 2 == number % 2) ? "black cell": "white cell"
        } else {
            return nil
        }
    }
}

let chessboard = Chessboard()
chessboard["A", 5]
chessboard["A", 8]

/* MARK: Exercise #2. Create TicTacToe game. Create field for this game, on every cell may be only following values: empty, cross, toe. Make opportunity to print the field. Add subscript that will set value to cells (with help od row and column coordinates). You must track programm correct work. You should also track next thing: user can't put cross or toe on cell where we alredy have any symbol. Add method to clear the field. Add algorithm that will give information about the winner. */

enum CellField: String {
    case cross = "❌"
    case toe = "⭕"
    case empty = "⬜"
}

struct TicTacToeField {
    let rows = 3
    let columns = 3
    var grid: [[CellField]]
    var cell = CellField.empty
    
    init() {
        print("New Game")
        grid = Array(repeating: Array(repeating: cell, count: columns), count: rows)
    }
    
    mutating func clear() -> Void {
        print("New Game")
        grid = Array(repeating: Array(repeating: cell, count: columns), count: rows)
        printField()
    }
    
    func printField() -> Void {
        for i in 0...rows + 1 {
            for j in 0...columns + 1 {
                1...rows ~= i && 1...columns ~= j ? print(grid[i-1][j-1].rawValue, terminator: "") : print("⬛", terminator: "")
            }
            print("")
        }
    }
    subscript(row: Int, column: Int) -> CellField? {
        get {
            if (1...3) ~= row && (1...3) ~= column {
                return grid[row-1][column-1]
            } else {
                return nil
            }
        }
        set {
            if (1...3) ~= row && (1...3) ~= column {
                if grid[row-1][column-1] == .empty {
                    grid[row-1][column-1] = newValue!
                    statusPrint()
                } else {
                    print("This position is busy.")
                }
            } else {
                print("Something goes wrong, point is out of range.")
            }
        }
    }
    private mutating func statusPrint() -> Void {
        
        let f = grid[0][0]
        let c = grid[1][1]
        let p = grid[2][2]
        
        if f == grid[1][1] && f == grid[2][2] && f != .empty {
            print("WINNER!")
            printField()
            clear()
        } else if f == grid[0][1] && f == grid[0][2] && f != .empty {
            print("WINNER!")
            printField()
            clear()
        } else if f == grid[1][0] && f == grid[2][0] && f != .empty {
            print("WINNER!")
            printField()
            clear()
        } else if c == grid[0][1] && c == grid[2][1] && c != .empty {
            print("WINNER!")
            printField()
            clear()
        } else if c == grid[1][0] && c == grid[1][2] && c != .empty {
            print("WINNER!")
            printField()
            clear()
        } else if p == grid[2][1] && p == grid[2][0] && p != .empty {
            print("WINNER!")
            printField()
            clear()
        } else if p == grid[1][2] && p == grid[0][2] && p != .empty {
            print("WINNER!")
            printField()
            clear()
        } else {
            printField()
        }
        
    }
}
var tic = TicTacToeField()
tic.printField()
tic[1, 1] = CellField.cross
tic[2, 2] = CellField.cross
tic[3, 3] = CellField.cross
tic[1, 1] = CellField.cross
tic[1, 2] = CellField.cross
tic[1, 3] = CellField.cross
