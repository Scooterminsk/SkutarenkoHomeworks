//: [Previous](@previous)

import UIKit

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Create structure "FileDescription" that will have following properties: way to this file, name of the file, max size of the file on the disk, way to folder that stores this file, type of the file (hidden or no), content of the file (may be simulated) */
var content = "There is a content simulated by me, yey"

struct FileDescription {
    lazy var wayToTheFile = "Finder/Documents/Films/2021\(name)"
    var name: String
    lazy var wayToTheFolder = "Finder/Documents/Films/2021"
    static var fileMaxSize = 10.5
    var fileSize: Double {
        didSet {
            fileSize = 0...FileDescription.fileMaxSize ~= fileSize ? fileSize: oldValue
        }
    }
    var fileType: FileType
    
    var fileContent: String {
        return content
    }
    
    enum FileType: String {
        case hidden, notHidden
    }
    
    mutating func simpleDescription(file: FileDescription) -> String {
        return file.fileType == .notHidden ? "Name of the file: \(name)\nWay to the file: \(wayToTheFile)\nFile size is: \(fileSize)\nThe content of the file: \(fileContent)" : "File is hidden"
    }
}
var myFile = FileDescription(name: "Olololu", fileSize: 8.3, fileType: .notHidden)
print(myFile.simpleDescription(file: myFile))
myFile.fileType = .hidden
print(myFile.simpleDescription(file: myFile))

/* MARK: Exercise #2. Create enumeration that will be some color spectrum. This enum must be Int type and as rawValue it must have 3-bites representation of the color. Add to this enum 3 type properties: colors count in spectrum, sirst color and last color. */

enum ShadesOfBrown: Int {
    static let colorNum = 27
    static let startColor = ShadesOfBrown.RosyBrown
    static let endColor = ShadesOfBrown.Tan3
    static func hexToRgb(hex: Int) -> UIColor {
        let r = Double((hex >> 16) & 0xFF) / 255.0
        let g = Double((hex & 0x00F00) >> 8) / 255.0
        let b = Double(hex & 0xFF) / 255.0
        let alpha = 1.0
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
    }
    
    case RosyBrown = 0xBC8F8F
    case RosyBrown1 = 0xFFC1C1
    case RosyBrown2 = 0xEEB4B4
    case RosyBrown3 = 0xCD9B9B
    case RosyBrown4 = 0x8B6969
    case SaddleBrown = 0x8B4513
    case SandyBrown = 0xF4A460
    case Beige = 0xF5F5DC
    case Brown = 0xA52A2A
    case Brown1 = 0xFF4040
    case Brown2 = 0xEE3B3B
    case Brown3 = 0xCD3333
    case Brown4 = 0x8B2323
    case Burlywood = 0xDEB887
    case Burlywood1 = 0xFFD39B
    case Burlywood2 = 0xEEC591
    case Burlywood3 = 0xCDAA7D
    case Burlywood4 = 0x8B7355
    case Chocolate = 0xD2691E
    case Chocolate1 = 0xFF7F24
    case Chocolate2 = 0xEE7621
    case Chocolate3 = 0xCD661D
    case Peru = 0xCD853F
    case Tan = 0xD2B48C
    case Tan1 = 0xFFA54F
    case Tan2 = 0xEE9A49
    case Tan3 = 0x8B5A2B
}
let viewMain = UIView()
viewMain.frame = CGRect(x: 0, y: 0, width: 100, height: 500)
viewMain.backgroundColor = UIColor.lightGray
var idx = 0
func printView(pattern: [ShadesOfBrown]) -> UIView {
    for gamma in pattern {
        let view = UIView()
        view.frame = CGRect(x: 25, y: CGFloat(idx * 50), width: 50, height: 50)
        view.backgroundColor = ShadesOfBrown.hexToRgb(hex: gamma.rawValue)
        viewMain.addSubview(view)
        idx += 1
    }
    return viewMain
}
var pattern: [ShadesOfBrown] = [.RosyBrown, .SaddleBrown, .Beige, .Brown1, .Brown3, .Chocolate, .Chocolate3, .Peru, .Tan3]
printView(pattern: pattern)

/* MARK: Exercise #3. Create class "Human" that will have the following properties: name, surname, age, height and weight. Then add some ranges: min and max weight, height, age, min and max letters in name and surname. The most interesting is to add humans count property. */

class Human {
    struct CountPeople { static var count = 0 }
    class var intervalAge: ClosedRange<Int> { return 18...90 }
    class var intervalNameLetter: ClosedRange<Int> { return 2...10 }
    class var intervalSurnameLetter: ClosedRange<Int> { return 2...15 }
    class var intervalHeight: ClosedRange<Double> { return 150...210 }
    class var intervalWeight: ClosedRange<Double> { return 40...180 }
    
    var name: String { didSet { name = Human.intervalNameLetter ~= name.count ? name: oldValue } }
    var surname: String { didSet { surname = Human.intervalSurnameLetter ~= surname.count ? surname: oldValue } }
    var age: Int { didSet { age = Human.intervalAge ~= age ? age: oldValue } }
    var height: Double { didSet { height = Human.intervalHeight ~= height ? height: oldValue } }
    var weight: Double { didSet { weight = Human.intervalWeight ~= weight ? weight: oldValue } }
    
    func simpleDescription() -> String {
        return "Name: \(name)\nSurname: \(surname)\nAge: \(age) years\nHeight: \(height)\nWeight: \(weight)"
    }
    
    class func cutString(str: String, range: ClosedRange<Int>) -> String {
        return String(str.prefix(range.last ?? 0))
    }
    
    init(name: String, surname: String, age: Int, height: Double, weight: Double) {
        
        self.name = Human.intervalNameLetter ~= name.count ? name: name.count < Human.intervalNameLetter.first! ? "ShortName" : Human.cutString(str: name, range: Human.intervalNameLetter)
        
        self.surname = Human.intervalSurnameLetter ~= surname.count ? surname: surname.count < Human.intervalSurnameLetter.first! ?  "ShortSurname": Human.cutString(str: surname, range: Human.intervalSurnameLetter)
        
        self.age = Human.intervalAge ~= age ? age : Human.intervalAge.first!
        self.height = Human.intervalHeight ~= height ? height: Human.intervalHeight.lowerBound
        self.weight = Human.intervalWeight ~= weight ? weight: Human.intervalWeight.lowerBound
        
        CountPeople.count += 1
    }
}

// create some objects of class "Human"
var human1 = Human(name: "Eugene", surname: "Kirilov", age: 22, height: 189, weight: 92)
human1.weight = 200
human1.height = 250

var human2 = Human(name: "Kirill", surname: "VeryVeryLongSurname", age: 25, height: 183, weight: 75)
human2.name = "KirilitoMaximelianoPromenadovskiy"

var human3 = Human(name: "veryVeryLongName", surname: "Pavlov", age: 125, height: 250, weight: 70)
human3.weight = 300

print("Population is: \(Human.CountPeople.count)")

for item in [human1, human2, human3] {
    print("\n")
    print(item.simpleDescription())
}
