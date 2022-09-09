//: [Previous](@previous)

import Foundation
import libkern

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Make extension for the enum from the lesson and add methods that will help to set that you buy any product. Then create methods, that will help to read if some product has set. */

enum CheckList: UInt8 {
    case Bread =   0b00000001
    case Chicken = 0b00000010
    case Apples =  0b00000100
    case Pears =   0b00001000
}

extension CheckList {
    
    func buyProduct(product: CheckList, listVar: inout UInt8) -> Void {
        switch product {
        case .Bread:
            listVar |= product.rawValue
            fallthrough
        case .Chicken:
            listVar |= product.rawValue
            fallthrough
        case .Apples:
            listVar |= product.rawValue
            fallthrough
        case .Pears:
            listVar |= product.rawValue
        }
    }
    
    func isProductBought(listVar: inout UInt8) -> Void {
        if listVar & CheckList.Bread.rawValue == CheckList.Bread.rawValue {
            print("You have already bought bread.")
        }
        if listVar & CheckList.Chicken.rawValue == CheckList.Chicken.rawValue {
            print("You have already bought chicken.")
        }
        if listVar & CheckList.Apples.rawValue == CheckList.Apples.rawValue {
            print("You have already bought apples.")
        }
        if listVar & CheckList.Pears.rawValue == CheckList.Pears.rawValue {
            print("You have already bought pears.")
        }
    }
    
}
var listVar: UInt8 = 0
var bread = CheckList.Bread
var chicken = CheckList.Chicken
var apples = CheckList.Apples
var pears = CheckList.Pears

bread.buyProduct(product: .Bread, listVar: &listVar)
chicken.buyProduct(product: .Chicken, listVar: &listVar)
apples.buyProduct(product: .Apples, listVar: &listVar)
pears.buyProduct(product: .Pears, listVar: &listVar)

bread.isProductBought(listVar: &listVar)

/* MARK: Exercise #2. Create loop that will draw a sinusoid, using binary operations. */

extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
        }
        return binaryString
    }
}

var firstNum: UInt8 = 0b00000001
for _ in 1...3 {
    for _ in 1...7 {
        print(firstNum.binaryDescription)
        firstNum <<= 1
    }
    for _ in 1...7 {
        print(firstNum.binaryDescription)
        firstNum >>= 1
    }
}
