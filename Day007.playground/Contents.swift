import Cocoa

// ********
// function
// ********

//function let us bundle and named a bunch of code to be used later
func showWelcome() { //function definition, name followed by parenthesis
    print("welcome to my App")
    print("We're glad you choose ny App")
    print("This app is very good")
}

//the body of the function is inside curly bracket

//calling the function
showWelcome()

//notice that isMultiple(of:) and random(in:) is another function, but they take input

//here we define function with input called paramenter
func printTimesTable(number: Int) { // it takes an integer as paremetr called number
    for i in 1...10 {
        print("\(i) * \(number) = \(i * number)") //parameter name then accessed inside the function
    }
}

printTimesTable(number: 3) // here the thing insides parentheses is argument, argument is passed into function

//function with multiple parameter
func printTimesTableWithEnd(number: Int, end: Int) {//this function takes two paramenter
    for i in 1...end {
        print("\(i) * \(number) = \(i * number)") //parameter name then accessed inside the function
    }
}

printTimesTableWithEnd(number: 2, end: 5) //the functin takes two arguments
// the order of argument and parameter must be the same


// ************************
// return value of function
// ************************

// sqrt is a function in cocoa it return the squareroot of an input
print(sqrt(169))

//you can also define a function that return something
func rollDice() -> Int { //Define a function that returns an integer
    return Int.random(in: 1...6) //the result is returned by the function
}

print(rollDice())

//returns true if both parameter received a string containing the same characters
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

print(areLettersIdentical(string1: "abc", string2: "bca"))

//we can actually make the function above shorter
func areLetersIdentical2(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

//if the function body only contains one expression then return can be removed
func areLetersIdentical3(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted() //but the expression must return the same type as the function
}
// to ommit return the expression must contains no loop, no declaration, no condition and so on.

// but it can contain ternary conditional operation

//this return "good" given true and "not good" given false
func trueOrFalse(value: Bool) {
    value ? "good" : "not good"
}

trueOrFalse(value: true)

//another example of function
//this one compute hypothenuse
func pythagoras(a: Double, b: Double) -> Double {
    let csquared = a*a + b*b
    let c = sqrt(csquared)
    return c
}

//shorter function computing hypothenuse
func pythagorasShort(a: Double, b: Double) -> Double {
    sqrt(a*a + b*b)
}
print(pythagorasShort(a: 3, b: 4))


// *************************
// returning multiple values
// *************************

//A function can return Array
func getUser() -> [String] {
    ["Alex", "Johnny"]
}
let user = getUser()
print("name: \(user[0]) \(user[1])") //but this is error prone

// a better way is to use dictionary
func getUser2() -> [String: String] {
    ["firstName": "Alex", "lastName": "Johnny"]
}
let user2 = getUser2()
print("name: \(user2["firstName", default: "Anon"]) \(user2["lastName", default: "Anon"])")
// ok, this is actually not that better, it's getting long

//but the real better way is to use tuple
func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Alex", lastName: "Johnny") //tuple of two string, each has name
}
let user3 = getUser3()
print("name: \(user3.firstName) \(user3.lastName)") //tuple is accessed with . and name
//the items in tuple is always available

//as a note in return statements the name of the tuple can actually be inferred by swift from parameters
func getUser4() -> (firstName: String, lastName: String) {
    ("Alex", "Johnny")
}
print(getUser4().firstName)

//we can also have tupple without name and access the items using index like array
func getUser5() -> (String, String) {
    ("Alex", "Johnny")
}
print(getUser5().0)
// index can also be used to access item in named tuple

//we can also pull apart the tuple returned by a function
let (firstName, lastName) = getUser3()
print("Name: \(firstName) \(lastName)")

// if you don't need one of the value you can use _ as in for loop (firstName, _)


// **********************
// custom parameter label
// **********************

/* parameter names are actually included in indentity of function
 and used in determining which function to use
*/

// func hireEmployee(name: String) {}
// func hireEmployee(title: String) {}
// are two different functions

//Sometimes we don't want to use name for argument in function call
// like in hasSuffix
"My name.".hasSuffix("name.")
//above, we don't use hasSuffix(string: "name.")

//to have the same things to our own function we use _ before parameter name
func upperCase(_ string: String) {
    string.uppercased()
}

print(upperCase("black"))

// use _ when the function name is a verb, and the first parameter is a noun, insert("name")
// also if the parameter name and the name of variable for argument is the same insert(string: string)

// we can also have two names for parameter
// one used when calling the function
// the other used inside the function

func printTimesTable(for number: Int) { // for is used when calling, number is used inside function body
    for i in 1...10 {
        print("\(i) x \(number) = \(i * number)") // inside we use number to access the parameter
    }
}

printTimesTable(for: 3) //see, here we use for in naming argument

//we use this two names to make the function call more readable

