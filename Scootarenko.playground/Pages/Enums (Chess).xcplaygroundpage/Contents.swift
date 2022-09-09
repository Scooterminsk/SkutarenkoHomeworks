//: [Previous](@previous)

import Foundation
import CoreGraphics

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Let's play chess again! At first we need to create enum with chess figures that will contains, color, type, letter and number of position on the chessdesk. Create several figures on the desk in combination of mat to the black king and add those figures to the array. */

/* MARK: Exercise #2. Create String rawValues for enums whith types of figures in English. Then create function that print name of figure, color and location on the desk. */

// enum for all figure parameters
enum Figure {
    // case pawn   (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    // case bishop (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    // case knight (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    // case castle (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    // case queen  (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    // case king   (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    case figure   (type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line)
    // chess type enum
    enum ChessType: String {
        case pawn = "Pawn"
        case bishop = "Bishop"
        case knight = "Knight"
        case castle = "Castle"
        case queen = "Queen"
        case king = "King"
    }
    // chess color enum
    enum ChessColor: String {
        case white = "White"
        case black = "Black"
    }
    // figure unicode-symbol enum
    enum Symbol: String {
        case whiteKingCode = "\u{2654}"
        case whiteQueenCode = "\u{2655}"
        case whiteCastleCode = "\u{2656}"
        case whiteBishopCode = "\u{2657}"
        case whiteKnightCode = "\u{2658}"
        case whitePawnCode = "\u{2659}"
        case blackKingCode = "\u{265a}"
        case blackQueenCode = "\u{265b}"
        case blackCastleCode = "\u{265c}"
        case blackBishopCode = "\u{265d}"
        case blackKnightCode = "\u{265e}"
        case blackPawnCode = "\u{265f}"
    }
    // figure row enum
    enum Row: String {
        case a = "a"
        case b = "b"
        case c = "c"
        case d = "d"
        case e = "e"
        case f = "f"
        case g = "g"
        case h = "h"
    }
    // figure line enum
    enum Line: Int {
        case one = 1, two, three, four, five, six, seven, eight
    }
}

// let's create the situation, where we have mat to black king
let blackKing = Figure.figure(type: .king, color: .black, symbol: .blackKingCode, row: .h, line: .eight)
let whiteKnight = Figure.figure(type: .knight, color: .white, symbol: .whiteKnightCode, row: .e, line: .five)
let whiteBishop = Figure.figure(type: .bishop, color: .white, symbol: .whiteBishopCode, row: .f, line: .six)
let whiteQueen = Figure.figure(type: .queen, color: .white, symbol: .whiteQueenCode, row: .g, line: .six)

// create array of fugures above
var arrOfFigures = [blackKing, whiteKnight, whiteBishop, whiteQueen]

// create function to print info about figure
func printFigure(arr: [Figure]) {
    for i in arr {
        switch i {
        case let .figure(type, color, _, row, line):
            print(type.rawValue, color.rawValue, (row.rawValue + String(line.rawValue)))
        }
    }
}
// print information about every figure in the array
printFigure(arr: arrOfFigures)

/* MARK: Exercise #3. Create function that returns chess desk with figures on default positions. It must be function that have an array of figures as an input parameter and it doesn't need to return anything */

let blackCell = "\u{25a0}", whiteCell = "\u{25a1}"

func coordinate(x: String, y: Int, figure: [Figure]) -> String {
    let l = ["a", "b", "c", "d", "e", "f", "g", "h"]
    for i in figure {
        switch i {
        case let .figure(_, _, symbol, row, line) where (row.rawValue + String(line.rawValue)) == (x + String(y)):
            return symbol.rawValue
        default:
            continue
        }
    }
    return l.firstIndex(of: x)! % 2 == y % 2 ? whiteCell: blackCell
}

func printChessboard(array: [Figure]) {
    let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
    var dictField = [String: String]()
    
    for i in 0..<letters.count {
        for j in 0..<numbers.count {
            dictField[letters[i] + String(j + 1)] = coordinate(x: letters[i], y: numbers[j], figure: array)
        }
    }
    for j in numbers.reversed() {
        for n in letters {
            print(dictField[n + String(j)]!, terminator: " ")
        }
        print(j, terminator: "\n")
    }
    for i in letters {
        print("\(i.uppercased())", terminator: " ")
    }
    print("\n")
}
printChessboard(array: arrOfFigures)

// MARK: Exercise #4. Write functions to move figures to possible positions. Then make some moves and print chessboard again.
func changePosition(figure: Figure, newPosition: (x: Figure.Row, y: Figure.Line)) -> Figure {
    var fig = figure
    switch fig {
    case let .figure(f, c, s, _, _):
        fig = .figure(type: f, color: c, symbol: s, row: newPosition.x, line: newPosition.y)
    }
    return fig
}

func possibleMoves(figure: Figure, new: (x: Figure.Row, y: Figure.Line)) -> Figure {
    var (name ,col, curX, curY): (Figure.ChessType, Figure.ChessColor, Figure.Row, Figure.Line)
    let change = changePosition(figure: figure, newPosition: (new.x, new.y))
    switch figure {
    case let .figure(figure, color, _, row, line):
        name = figure
        col = color
        curX = row
        curY = line
    }
    let (oldX, newX) = transformX(old: curX, new: new.x)
    
    func transformX(old x: Figure.Row, new x1: Figure.Row) -> (Int, Int) {
        let letter = ["a", "b", "c", "d", "e", "f", "g", "h"]
        var (oldX, newX): (Int?, Int?)
        for i in 0..<letter.count {
            x.rawValue == letter[i] ? oldX = i: nil
            x1.rawValue == letter[i] ? newX = i: nil
        }
        return (oldX!, newX!)
    }
    
    func castleCondition(xy: (x: Figure.Row, y: Figure.Line, x1: Figure.Row, y1: Figure.Line)) -> Bool {
        return (xy.x == xy.x1 && xy.y != xy.y1) || (xy.x != xy.x1 && xy.y == xy.y1) ? true: false
    }
    
    func bishopCondition(xy: (x: Int, x1: Int, y: Int, y1: Int)) -> Bool {
        let (a, b) = (a: xy.x - xy.x1, b: xy.y - xy.y1)
        return abs(a) == abs(b) ? true: false
    }
    
    switch name {
    case .king:
        return -1...1 ~= (oldX - newX) && -1...1 ~= (curY.rawValue - new.y.rawValue) ? change: figure
    case .knight:
        switch (oldX, curY, newX, new.y) {
        case let (x, y, x1, y1) where ((x + 1 == x1) && (x - 1 == x1)) && ((y.rawValue + 2 == y1.rawValue) || (y.rawValue - 2 == y1.rawValue)):
            return change
        case let (x, y, x1, y1) where ((x + 2 == x1) && (x - 2 == x1)) && ((y.rawValue + 1 == y1.rawValue) || (y.rawValue - 1 == y1.rawValue)):
            return change
        default:
            return figure
        }
    case .castle:
        return castleCondition(xy: (curX, curY, new.x, new.y)) ? change: figure
    case .bishop:
        return bishopCondition(xy: (oldX, newX, curY.rawValue, new.y.rawValue)) ? change: figure
    case .queen:
        let castle = castleCondition(xy: (curX, curY, new.x, new.y))
        let bishop = bishopCondition(xy: (oldX, newX, curY.rawValue, new.y.rawValue))
        return castle || bishop == true ? change: figure
    case .pawn:
        if col == .white {
            if curY.rawValue == 2 && oldX == newX && 3...4 ~= new.y.rawValue {
                return change
            } else if oldX == newX && (new.y.rawValue - curY.rawValue) == 1 {
                return change
            }
            return figure
        }
        return figure
    }
}
arrOfFigures[0] = possibleMoves(figure: arrOfFigures[0], new: (Figure.Row.g, Figure.Line.seven))
arrOfFigures[2] = possibleMoves(figure: arrOfFigures[2], new: (Figure.Row.h, Figure.Line.four))
printChessboard(array: arrOfFigures)
