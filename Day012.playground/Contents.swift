import Cocoa

// *****
// Class
// *****

// class is like struct, they have property, method, custom initializer
// but class can build upon other class
// class don't have memberwise functionality
// class is copied by reference
// class has deinitializer
// constant class can still change

// an exxample of a class
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// ***********
// Inheritance
// ***********

// we can make a class inherit from a base class
// base class
class Employee {
    let hours: Int
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work for \(hours) hours a day.")
    }
}

// subclass that inherit from Employee
// hence they both have the property of Employee
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
 
    // override, see below
    override func printSummary() {
        print("I sometimes work for \(hours) hours.")
    }
}
class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let ray = Developer(hours: 8)
ray.printSummary()

// to change the method of base class in the subclass use override
// if you want a method not to be override you use final


// ******************
// class initializers
// ******************

    // initializer of a classs must also call its base class'
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) // calling base class initializer
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)


// *************
// copying class
// *************

// class is copied by reference
class User {
    var userName = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.userName = "Taylor"
print(user1.userName)

// if you want a unique copy you need to deep copy
// which actually creating new object


// *************
// deinitializer
// *************

// a class can have deinitializer, called when an instance is destroyed
// you can't call it directly or giving it parameter (It's not followed by ())

class Student {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Student \(id): I'm on!")
    }
    
    deinit {
        print("Student \(id): I'm off!")
    }
}

// an instance is destroyed when the function/if/loop where it's created is closed
// but there musn't be any ither copy pointing to the class

for _ in 1...3 {
    let _ = Student(id: 123)
    print("I'm working!")
}


// ***********************
// variable inside classes
// ***********************

// a variable if a constant instance class can still change
/*
 in f|ct we have 4 tyoes of options
 1. constant instance constant property
 2. constant instance variable property
 3. variable instance constant property
 4. variable instance variable property
 */

// ************
// checkpoint 7
// ************

// cats and dogs

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("bark, bark")
    }
}

class Corgi: Dog {
    override func speak() {
        print("corgi bark")
    }
}

class Poodle: Dog {
    override func speak() {
        print("poodle bark")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    func speak() {
        print("meeow")
    }
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

class Persian: Cat {
    override func speak() {
        print("persian meeow")
    }
}

class Lion: Cat {
    override func speak() {
        print("lion meeow")
    }
}
