import Cocoa

// ******
// struct
// ******

// structs are our own custom, complex data type
// they can contain constants, variables (or here we call them properties) and functions (method)

//a struct with three variables and one function
struct Album { //use uppercase for struct as convention
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by: \(artist)")
    }
}

// defining an instance of our struct, using initializer
let firstAlbum = Album(title: "The first", artist: "an artist", year: 1998)
let secondAlbum = Album(title: "The next one", artist: "an artist reborn", year: 2008)

print(firstAlbum.title) // accessing constant
secondAlbum.printSummary() // accessing function

//a struct wih variable
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) { // mutating, we need it because we change struct variable
        if vacationRemaining >=  days {
            vacationRemaining -= days //here we change vacationRemaining
            print("Let's have vacation")
            print("vacation days remaining: \(vacationRemaining)")
        } else {
            print("vacation remaining days not enough")
        }
    }
}

// variable instance of Employee
var smith = Employee(name: "Smith", vacationRemaining: 100)
smith.takeVacation(days: 20)
//note that because Employee whave mutating func, we can't define constant of Employee

// in initializer, when we define new instance, we actually called special function called init
var harry = Employee.init(name: "Harry", vacationRemaining: 40)

//by the way, explicit completion of type is also init
let a = Double.init(3) + 4.0

// we can also have default value for properties, so that we can ommit them during initialization
struct Name {
    var first: String
    var last = "Jones"
}

print("\(Name(first: "Alex")) and \(Name(first: "Bert", last: "Don"))")

//use tuple if you want to use it once, use struct if you want to use it multiple times


// *******************
// computed properties
// *******************

// We could redefine employee struct to also contain computed property
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    //computed property
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
    // this is computed instead of stored
}

var alex = Employee2(name: "Alex")
print(alex.vacationRemaining)
alex.vacationTaken += 4
print(alex.vacationRemaining)

//but here, we can only access computed property
//the following will let us also change the computed property
struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        } //called when we access the property
        set {
            vacationAllocated = vacationTaken + newValue
        } //called when we change the property, notice that it cahnges vacation Allocated
    }
}

var ben = Employee3(name: "Ben")
print(ben.vacationAllocated)
ben.vacationRemaining += 2
print(ben.vacationAllocated)

//use computed property if it depends on other property
// don't use it if we call it often, it slows the program
// computed properties cannot be constant, and we need to annotate the type


// *****************
// property observer
// *****************

// this struct will print a prompt everytime its property is changed
struct Game {
    var score = 0 {
        didSet { //called after the score is changed
            print("The score is now \(score)")
        }
    }
}

var game = Game()
game.score += 4

//we can also define block to be executed before the property change with willSet
struct App {
    var contacts = [String]() {
        willSet { //called before contacts is changed
            print("current value is \(contacts)")
            print("new value will be \(newValue)")
        } //new value is the new value given to contacts in the assignment
        
        didSet { //called after contacts is changed
            print("there are now \(contacts.count) contacts")
            print("there was \(oldValue.count) contacts")
        } //old value is the old value of contacts before the assignment
    }
}

var app = App(contacts: ["alex"])
app.contacts.append("Ben")

//don't use property obsever too much though, it slows the program


// ******************
// custom initializer
// ******************

//we can define our own initializer
struct Player {
    let name: String
    let number: Int
    
    //initializer
    init(name: String, number: Int) {// function but with no func
        self.name = name //assign name from parameter to my property of name
        self.number = number
    } //just create new player, no return type
}
//but the above definition will be the same as in the case where we don't define our own.

//this time we have custiom initializer
struct Player2 {
    let name: String
    let number: Int
    
    init(name: String) {// only accept name
        self.name = name
        self.number = Int.random(in: 1...6) // give the number randomly
    }
}
let charlie = Player2(name: "Charlie")
print(charlie.number)

// method called inside init must only access already defined variable
// we can have multiple init
// but once we have one our own init, the swift default memberwise initializer will not be available
