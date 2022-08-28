import Cocoa

// ***********************
// Parameter Default Value
// ***********************

// below, the second paremeter, end has default value
// the default value will be use if it is not igven in the argument in function call
func printTimesTable(for number: Int, end: Int = 10) { //default value of end is 10
    for i in 1...end {
        print("\(i) x \(number) = \(i*number)")
    }
}

printTimesTable(for: 3) //calling only with number, end will use default value
printTimesTable(for: 4, end: 3) //calling with both number and end

//an example of nction with default parameter
var characters = ["tom", "jerry"]
characters.removeAll() //remove all items and free up space
characters.removeAll(keepingCapacity: true) //remove all, but keep the space


// **************
// error handling
// **************

// let see error handling case in user password recommendation

//first, we define the error using enum
enum PasswordError: Error { //this enum type is built from swift Error type
    case short, obvious //possible kind of errors
}

//second, we write function that throws this error
func checkpassword(_ password: String) throws -> String { //notice the word throws, it means this may have error
    if password.count < 5 {
        throw PasswordError.short //throw short error if it's too short
    }
    if password == "12345" {
        throw PasswordError.obvious //thwor obvious error if it is
    }
    if password.count < 8 {
        return "All right"
    } else if password.count < 12 {
        return "Great"
    } else {
        return "Excellent"
    }
}

//lastly, we call the function and specifiy the handling procedure using catch
let string = "12345"
do {
    try checkpassword(string) // function that may throw an error is put after "try" inside a "do"
} catch {
    print("there was an error") //block after catch is executed if there is an error inside do
}
//if an error is encountered the function will stop and the eecution will immediately go to catch

// you can also have multiple catch handling different kind of errors
do {
    try checkpassword(string)
} catch PasswordError.short {
    print("Too short, baby")
} catch PasswordError.obvious {
    print("Too obvoious, sir")
}


// ********************
// summary of functions
// ********************

/*
 1. function let us reuse part of our code again and again
 2. function can have one or more parameter
 3. name of the parameter inside function and in the function call can be made different
 4. parameter can have default value
 5. function can return multiple value as tuple
 6. function can throw error
 */


// ************
// checkpoint 4
// ************

//a function that calculate squareroot for square number from 1 through 10_000

//two kind of errors
enum RootError: Error {
    case outOfBoundError, noRootError
}

// the function
func squareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw RootError.outOfBoundError
    }
    for i in 1...100 {
        if i*i == number {
            return i
        } else if i*i > number {
            throw RootError.noRootError
        }
    }
    throw RootError.noRootError
}

do {
    try squareRoot(of: 49)
} catch RootError.outOfBoundError {
    print("out of bound")
} catch RootError.noRootError {
    print("no integer root")
}
