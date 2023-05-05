import Cocoa // importing a bunch of important stuff, don't delete.

var greeting = "Hello, playground" // declaring a variable called greeting and assigning it a "Hello, playground" string.


// Variable and constant
// *********************


var name = "Ted" // declaring a variable called name and assigning its value to string "Ted"
name = "Rebecca" // chaning the value of name to "Rebecca"
/* here we just change an existing variable and don't declare a new one.
 Hence we ommit the var */

let character = "Daphne" // declaring a constant called character, assigning its value to "Daphne"
// character = "Eloise" // this is error, cannot change the value of a constant

/* use constant for a valur that won't change in the program.
 It makes the program run more effectively aand prevent you from changing it by mistake.*/


var playerName = "Roy" //notice that playerName is in camel case. It's not mandatory but just a convention.
print(playerName) //printing the value of playername to the console, used only in app development for checking


// String
// ******

let actor = "Denzel Washington" //string is a text,
let fileName = "paris.jpg" //it can contain punctuation
let result = "⭐️ You win! ⭐️" //it can contain emoji
let quote = "Then he tapped the sign sayying \"Believe Me\" and walked away"
//use backslash to use double quotes inside string

let movie = """
A day in
the life of an
Apple engineer
"""
/* use triple quotes for multiline string. You'll rarely use it, if ever.
the triple double quotes shuld be in the respective places shown above,
 after the equal signs and on th last line, alone. */

print(actor.count) // print the length of the string actor
print(result.uppercased()) //print the string result whose characters changed into uppercase
/* notice that count doesn't followed by (). It only retrieves a value,
meanwhile upercase do some work for you */

print(movie.hasPrefix("A day")) //print if movie string starts with "A day"
print(fileName.hasSuffix(".jpg")) //print if fileName string ends with ".jpg"
// both hasPrefix and hasSuffix are case sensitive


// Int
// ***

let score = 10 //declaring constant score with value 10, an integer
let reallyBig = 10_000_000 // big numbers can be broken up using _ so that it is clearer.

//making new integers from an old one using arithmetic
let lowerScore = score - 3
let higherScore = score + 3
let doubledScore = score * 2
let halvedScore = score / 2
let squaredScore = score * score

var counter = 10
counter = counter + 5 //operating on an old value of counter and change the old value with the result
counter += 5 //equivalent to counter = counter + 5

let number = 12
print(number.isMultiple(of: 3)) //prints whether variable number is multiple of 3.


// Double
// ******

let floatingNumber = 0.1 + 0.2 // declaring a variable with floating-point numbers or double
print(floatingNumber) // a small problem with double, it doesn't quite add up to 0,3

// to add integer and double you need to turn both into the same type first explicitly
let intResult = 1 + Int(2.0)
let doubleResult = Double(1) + 2.0

// type safety: once you decleared a variable of one type you cannot change it to another type
//swift automatically infer a type once its assigned a value, for example integer, double, or string
var anInteger = 1
//anInteger = 2.0 // error, you can't change integer to double
var aString = "one"
//aString = 1 //also error, you can't change string to integer

//sometimes you'll see CGFloat instead of Double on some apple API, It's the old version of Double.

// additional comment to check github connection fromo new macbook
