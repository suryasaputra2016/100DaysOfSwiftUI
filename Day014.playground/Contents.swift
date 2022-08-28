import Cocoa

// *********
// optionals
// *********

// a dictionary
let opposite = [
    "tall": "short",
    "far": "near",
]

// the following constant is defined from element of a dictionary with certain key
let farOpposite = opposite["far"]

// because it is possible that the key doesn't exists, the type of farOpposite is optional
type(of: farOpposite)
//optional can contain data of the type, or they contain nothing, that is a special value called nil

//to use optional we unwrap it using if let
if let farOpposite = opposite["far"] {
    print("unwrapped name = \(farOpposite).")
} else {
    print("no value")
}

//here to declarea an optional
let number: Int?

number = nil

//unwrapping, notice that we can unwrap optional into the same name
if let number = number { // unwrapping to the same name
    print(number) // here number is Int not optional Int?
} else {
    print("nil")
}


// *********************
// unwrapping with guard
// *********************


// using guard we can have block of code eecuted if the optional is nil
func printValue(number: Int?) {
    guard let number = number else {
        print("nil") // will be run if number has no value or nill
        return // early return
    }
    print(number)
}

printValue(number: number)

//the block after conditional unwrapping is executed if the type has value
// the block after guard unwrapping is executed if the type is nil
// but the block following guard must have early return, so guard must be defined inside function


// **************
// nil coalescing
// **************

// a third way to unwrap an optional, nil coalesing
let adjective = opposite["near"] ?? "N/A"
//adjecive will have the value coresponed to key near on the opposite dictionary
// if the key exist, if not it will have value of "N/A"
print(adjective)

// nil coalescing works for any optional type
let name: String?
name = "my name"
print(name ?? "anonymous")


// *****************
// optional chaining
// *****************

// we can have chain of optional like the following
let people = ["Al", "Ben"]

let chosenOne = people.randomElement()?.uppercased() ?? "No one"

// if one of the chain berak then it will produce nil
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "no author"
// the line above conatins many optionals.


// *****************
// failable function
// *****************

// we can use optional to handle failable function

enum UserError: Error {
    case badID, networkFailed
}


// this function always throw error
func getUserID(id: Int) throws -> String {
    throw UserError.networkFailed
}


// handling the function using optional
if let user = try? getUserID(id: 123) {
    print("User: \(user)")
}
// use it if you don't care if the function succeed, you just want the valua if it can be obtained


// ************
// checkpoint 9
// ************

func randomItem(from numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}


print(randomItem(from: [1, 3, 4, 5, 78, 99]))
