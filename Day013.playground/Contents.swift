import Cocoa

// *********
// protocols
// *********

// protocols define the functionality a datatype must have
// but it doesn't actually implement it
protocol Vehicle {
    func estimatedTime(for distance: Int) -> Int
    func travel(distance: Int)
}
// above the function is just a requirement, no code inside
// you can define the functions as mutating or throwing

// then we can maka a class or struct that mplement the protocol
struct Car: Vehicle { // Car conforms to the vehicle protocol
    
    //since it confronts to the protocol the following two function must exist
    //and implemented here with exact name, parameter, and return value
    func estimatedTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving for \(distance) km")
    }
    
    // the struct can also have additional function, not on defined on the protocol
    func openSunRoof() {
        print("Opening sun roof.")
    }
}

// a function that uses the struct
func commute(distance: Int, using vehicle: Vehicle) { //see that the protocol can be used as type of parameter
    if vehicle.estimatedTime(for: distance) > 100 {
        print("too slow")
    } else {
        vehicle.travel(distance: distance)
    }
}

// Let's define another struct confrontinf to the protocol Vehicle
struct Bicycle: Vehicle {
    func estimatedTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling for \(distance) km")
    }
}

// now we can use the new struct in the function commute

let bike = Bicycle()
commute(distance: 50, using: bike)


// we can also define variable inside a protocol
protocol Vehicle2 {
    var name: String { get } // get means it needs to be at leastreadable,
    // either consant or computed variable with get is sufficient
    
    var currentPassenger: Int { get set } // the variable is readable and writable,
    // either variable or computed variable with get set
    
    func estimatedTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// protocol can also be used as type of array,
// and if we redefine bike and car to confrom to vehicle 2

struct Car2: Vehicle2 {
    var name = "Car"
    var currentPassenger = 1
    
    func estimatedTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving for \(distance) km")
    }
}

struct Bicycle2: Vehicle2 {
    var name = "Bicycle"
    var currentPassenger = 1
    
    func estimatedTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling for \(distance) km")
    }
}

// we can have the following function
func getTravelEstimates(using vehicles: [Vehicle2], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimatedTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km.")
    }
}

let car2 = Car2()
let bike2 = Bicycle2()

getTravelEstimates(using: [car2, bike2], distance: 50)

// a struct or class can confrom to multiple protocol by listing them with comma


// ******************
// opaque return type
// ******************

//we can expect a function to return some protocol
// but that actually won't work since there could be some differences in those that implements protocol

/*
func getRandomNumber() -> Equatable {
    Int.random(in: 1...10)
}
func getRandomBoolean() -> Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber()) // this one will be error
 */

// but sometimes we know that the difference won't matter, as in the print statement above
// so we use opaque types so that swift know the real implementation, but we just don't care which one

func getRandomNumber() -> some Equatable { //some means some type conforming to equatable
    Int.random(in: 1...10)
}
func getRandomBoolean() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())


// *********
// extension
// *********

// in apple foundation API we have function to trim whitespace

var quote = "   some quote with extra white space      "
print(quote.trimmingCharacters(in: .whitespacesAndNewlines))

// but we can define new function for String in extention
// so that we make it shorter to trim

extension String { // we add new functionality directly to String
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

print(quote.trimmed()) //shorter trimming

// we can actually create a clobgal function to do just that but
// extension make it easier to implement, not make our code messy, and have full access to private data
// in extesion we can also change the string directly

/* we can define the following inside extension of string
mutating func trim() {
    self = self.trimmed()
}
 */

// as convention a function that modifies the object has plain verb
// while those that return new values has -ed or -ing suffix

//we can only add computed property in an extension

// thre is a neat trick
// you know that in a struct once we define custom initializer
// we'll lose swift default memberwise initializer
// but if we define the custom initializer inside extension
// we'll still get the memberwise initializer


// ******************
// protocol extension
// ******************

// we can extend to a protocol
extension Collection { // collection is a protocol containing array, set and dictionary
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
// hence we can use the new computed var in any type conforming to Collection

// by defining a functionality of protocol inside exension
// a type conforming to that protocol don't need to implement the function
// since it can just use the one defined on the extension
// but it can define its custom implementation if needed.


// ************
// checkpoint 8
// ************

// building protocol

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int {get set}
    var agentName: String { get set }
    
    func buildingSummary()
}

struct House: Building {
    var numberOfRooms = 4
    var cost = 10_000
    var agentName = "Michael"
    
    func buildingSummary() {
        print("This house has \(numberOfRooms) rooms, with price of \(cost) USD")
        print("The agent for this house is \(agentName).")
    }
}

struct Office: Building {
    var numberOfRooms = 8
    var cost = 30_000
    var agentName = "Alex"
    
    func buildingSummary() {
        print("This office has \(numberOfRooms) rooms, with price of \(cost) USD")
        print("The agent for this office is \(agentName).")
    }
}

let house = House()
let office = Office()

house.buildingSummary()
office.buildingSummary()

