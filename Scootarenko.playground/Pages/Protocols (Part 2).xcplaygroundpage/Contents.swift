//: [Previous](@previous)

import Foundation
import Darwin

var greeting = "Hello, playground"

//: [Next](@next)

/* MARK: Exercise #1. Read about stecks and queues. */

/* MARK: Exercise #2. Using protocol "Container", make an exension "Container" for class "Array", so that we can use array as a stack. As a type you should use Element instead of Self.Generator.Element. */

/* MARK: Exercise #3. Create an extension of "Container", that will give an opportunity to manage an array like if it is a queue. Read about queue in Internet. */

/* MARK: Exercise #4. Code woun't work, try to fix it. */

/* MARK: Exercise #5. You should figure out what's goin on. You should read about inheritance structure and protocols of Array. */

protocol Container: MutableCollection {
    
    mutating func pop() -> Self.Iterator.Element?
    mutating func push(element: Self.Iterator.Element)
    func peek() -> Self.Iterator.Element?
}

extension Container {
    var head: Element? {
        return self.first
    }
    var tail: Element? {
        return !self.isEmpty ? self[self.endIndex] : nil
    }
}


extension Array: Container {
    mutating func pop() -> Element? {
        guard !self.isEmpty else {
            return nil
        }
        return self.removeFirst()
    }
    mutating func push(element: Element) {
        self.append(element)
    }
    func peek() -> Element? {
        return !self.isEmpty ? self[endIndex] : nil
    }
    var head: Element? {
        return self.first
    }
    var tail: Element? {
        return !self.isEmpty ? self[self.endIndex - 1] : nil
    }
}

var arr = [1, 3, 5, 10, 9]
arr.pop()
arr.push(element: 3)
arr.head
arr.tail


