import Cocoa

// ********
// closures
// ********

//function is like other value, it can be copied

//initial function
func greetUser() {
    print("Hello")
}


//copying function to another variable, notice the lack of ()
var greetCopy = greetUser

//calling the copy function
greetCopy()

//function can also be declared similar to variable
let sayHello = {
    print("Hello again")
}
// the block inside curly braces above that is assigned to sayHello is basically function without name
// it is called closure expression

sayHello()

//if you want closure that accept argument and return a value, write it like this

let sayHello2 = { (name: String) -> String in //parameter is written here before the return type and "in"
    "Hello \(name)" //the body of closure using the parameter
}
// aboev in separates the paramater and return type with the closure body

print(sayHello2("Jack")) // we don't use name here bea=cause parameter only applies to the original function, not copy

// declaration of function type
var greetingAgain: () -> Void // this function takes no argument and return nothing as in sayHello
var greetiingAgain2: (String) -> String // this function takse a string as argument and return string as in sayHello2

// we can pass function as parameter, such as in array's sorted function
//sorted can have argument with external name by that accept function with two string argument and return boolean

//this is custom comparation function that make captain Suzanne in the first position
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted(by: captainFirstSorted)
print(sortedTeam)

// we can also just put closure in the argument
let anotherSortedTeam = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

//closure cannot use external parameter label


// ************************
// closure shorthand syntax
// ************************

// since sorted alrady expect function with two string argument and return boolean, we can ommit them
// notice we also ommit parentheses and by, which can be ommited
let anotherSortedTeam2 = team.sorted{ name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

// we can simplify the closure further by not naming the input and use special keywords $0 and $1
let anotherSortedTeam3 = team.sorted{
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}



//now we just want the team to be reversed sorted.
// we can use the following
let reverseSortedTeam = team.sorted{ $0 > $1 }
print(reverseSortedTeam)

//in array there is also filter and map function that take closure
// and perform the intended operation accordingly (see below)
print(team.filter{ $0.hasPrefix("T") }) //filter only to names beginning with T
print(team.map{ $0.uppercased()}) // transform each items into upper case


// *********************
// function as parameter
// *********************

// this function accept Int, and function returning integer
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator() // here we use function accepted in parameter
        numbers.append(newNumber)
    }
    
    return numbers
}

// let's call this function
var rolls = makeArray(size: 20) {
    Int.random(in: 1...20) // function for generator
} //trailing closure

print(rolls)

// you can also name the function and pass it into makeArray
func generateaNumber() -> Int {
    Int.random(in: 0...20)
}

rolls = makeArray(size: 10, using: generateaNumber)

// a function can have multiple function parameter
// and called using multiple trailing closure
func work(first: ()->Void, second: ()->Void, third: ()->Void) {
    print("first:")
    first()
    print("second")
    second()
    print("third")
    third()
}

//calling the function with multiple trailing closure
work {
    print("this is the first")
} second: {
    print("this is the second")
} third: {
    print("this is the third")
}


// *******
// summary
// *******

/*
 1. function can be copied but parameter names are lost
 2. function have types like simple data
 3. closure can be assgined,
 4. closure can be passed onto a function
 5. we can use closure trailing
 6. we can ommit naming parameter in closure and use $0, $1, etc
 
 */


// ************
// checkpoint 5
// ************

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let edited = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map {"\($0) is a lucky number"}

for string in edited {
    print(string)
}
