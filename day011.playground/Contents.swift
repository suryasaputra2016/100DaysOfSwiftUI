import Cocoa

// **************
// access control
// **************

struct BankAccount {
    private var funds = 0 // this can only accessed by method within the struct
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

// in struct above funds can only br accessed by deposit and withdraw function
// we can't do "account.funds += 10_000" for example

// some options of access control
// private, can only be accessed from within the struct
// fileprivate, can only be accessed from within the same file
// public, can be accessed from anywhere, the default value
// private(set) can only be modified from within the struct, can be read from anywhere


// *****************
// static properties
// *****************

// static properties are attached directly to a struct not an instance of struct
// used for sample data, or data used in a lot of place
struct School {
    static var studentCount = 0
    
    static func add(student: String) { // no mutating
        print("\(student) joined school")
        studentCount += 1
    }
}

// using the properties
School.add(student: "Taylor")
print(School.studentCount)

// nonstatic properties can't be accessed from static one
// static property casn be accessed from nonstatic one using struct name or Self


// *****************
// summary of struct
// *****************

/*
 1. struct has properties (variable) and method (function)
 2. method that change properties must be mutating
 3. you can create computed instead of stored value
 4. you ca attach observer to properties
 5. you can have your own custom initializer
 6. we can set acess option of properties
 7. we can attach properties to struct using static
 */


// ***********
// checkpoint6
// ***********


// a model of a car
struct Car {
    let model: String
    let numberOfSeat: Int
    
    static let maxGear = 6
    private(set) var currentGear = 0
    
    mutating func gearUp() {
        if currentGear < Self.maxGear {
            currentGear += 1
        }
    }
    
    mutating func gearDown() {
        if currentGear > 0 {
            currentGear -= 1
        }
    }
    
    init(model: String, numberOfSeat: Int){
        self.model = model
        self.numberOfSeat = numberOfSeat
    }
}

var myCar = Car(model: "truck", numberOfSeat: 2)
myCar.gearUp()
print(myCar.currentGear)
