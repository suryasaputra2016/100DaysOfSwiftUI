import Cocoa

// ***************
// type annotation
// ***************

// when declaring constant/variable with initial value, swift will deduce the type
// it's called type inference
let name = "Harry" //swift infer it to be string
let age = 19 //swift infer it to be integer

//we can also say the type expllicitly using type annotation
let surname: String = "Potter"
let height: Double = 120 // even though we assign with an integer, height will be double
let numOfHorcruxes: Int = 7 //if you want integer type
let isFinished: Bool = true //boolean type
let horcruxesLeft: [String] = ["Harry", "Nagini"] // array of string
let bio: [String: String] = ["name": "Harry"] // dictionary of string: string key: value
let books: Set<String> = Set(["the first book", "my second book"]) //set of string, pardon my unoriginality

//actually type annotation not needed if we give initial value, or use constructor
var bookToReadThisMonth = ["my third book", "my fourth book"]
var bookToReadThisYear = [String]()
//both will be infered as string
// don't use type annotation unless needed (e.g. when you don't know what to assign at declaration)
let result: Double //don't know the (constant) result yet, except that it's a double.
result = 3.1 //we can assign value to a constant that doesn't have value yet
// unassigned value is possible, but you'll need type annotation and you can't use it before assining it some value

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.system //enum is its own type, for later assignment you don't need UIStyle before .


// ***********************
// summary of complex data
// ***********************

/*
 1. array contains several items of the same type arranged sequentially, accessed using zero based index
    array have count, append(), contains()
 2. dictionary contains several key: value pairs, where the values are accessed by the keys
    dictionary also have count and contains()
 3. Set is several items which are forced to be unique, and the order is determined by swift for efficient retrieval
 4. enum let us define data type that has only several specific possible values
 5. swift must know the type of declared data, either by type inference or type annotation
 */



// ************
// checkpoint 2
// ************

//array of string, printing number of elements, and printing number of unique element
let myArray = ["string1", "string2", "string3", "string1"]
print(myArray.count)
print(Set(myArray).count)
