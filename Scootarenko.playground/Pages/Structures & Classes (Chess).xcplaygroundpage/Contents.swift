//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// chess figure class
class Figure {
   
    var type: ChessType
    var color: ChessColor
    var symbol: Symbol
    var row: Row
    var line: Line
    
    init(type: ChessType, color: ChessColor, symbol: Symbol, row: Row, line: Line) {
        self.type = type
        self.color = color
        self.symbol = symbol
        self.row = row
        self.line = line
    }
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
let blackKing = Figure(type: .king, color: .black, symbol: .blackKingCode, row: .h, line: .eight)
let whiteKnight = Figure(type: .knight, color: .white, symbol: .whiteKnightCode, row: .e, line: .five)
let whiteBishop = Figure(type: .bishop, color: .white, symbol: .whiteBishopCode, row: .f, line: .six)
let whiteQueen = Figure(type: .queen, color: .white, symbol: .whiteQueenCode, row: .g, line: .six)


// create array of fugures above
var arrOfFigures = [blackKing, whiteKnight, whiteBishop, whiteQueen]

// create function to print info about figure
func printFigure(arr: [Figure]) -> Void {
    for i in arr {
        print(i.type.rawValue, i.color.rawValue, (i.row.rawValue + String(i.line.rawValue)))
    }
}
    
    func coordinate(x: String, y: Int, figure: [Figure]) -> String {
        let blackCell = "\u{25a0}", whiteCell = "\u{25a1}"
        let l = ["a", "b", "c", "d", "e", "f", "g", "h"]
        for i in figure {
            if (i.row.rawValue + String(i.line.rawValue)) == (x + String(y)) {
                return i.symbol.rawValue
            } else {
                continue
            }
        }
        return l.firstIndex(of: x)! % 2 == y % 2 ? whiteCell: blackCell
    }
    
    func printGameDesk(array: [Figure]) -> Void {
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
        var dictField = [String:String]()
       
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
            print(i.uppercased(), terminator: " ")
        }
        print("\n")
    }
    
    func changePosition(figure: Figure, newPosition: (x: Figure.Row, y: Figure.Line)) -> Figure {
        var fig = figure
        switch (fig.type, fig.color, fig.symbol, fig.row, fig.line) {
        case let (f, c, s, _, _):
            fig = Figure(type: f, color: c, symbol: s, row: newPosition.x, line: newPosition.y)
        }
        return fig
    }
    
    func possibleMoves(figure: Figure, new: (x: Figure.Row, y: Figure.Line)) -> Figure {
        var (name, col, curX, curY): (Figure.ChessType, Figure.ChessColor, Figure.Row, Figure.Line)
        let change = changePosition(figure: figure, newPosition: (new.x, new.y))
        switch ((figure.type, figure.color, figure.symbol, figure.row, figure.line)) {
        case let (figure, color, _, row, line):
            name = figure
            col = color
            curX = row
            curY = line
        }
        let (oldX, newX) = transformX(old: curX, new: new.x)
        
        func transformX(old x: Figure.Row, new x1: Figure.Row) -> (Int, Int) {
            let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
            var (oldX, newX): (Int?, Int?)
            for i in 0..<letters.count {
                x.rawValue == letters[i] ? oldX = i: nil
                x1.rawValue == letters[i] ? newX = i: nil
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
    



// print information about every figure in the array
printFigure(arr: arrOfFigures)
printGameDesk(array: arrOfFigures)
arrOfFigures[0] = possibleMoves(figure: arrOfFigures[0], new: (Figure.Row.g, Figure.Line.seven))
arrOfFigures[2] = possibleMoves(figure: arrOfFigures[2], new: (Figure.Row.h, Figure.Line.four))
printGameDesk(array: arrOfFigures)
