import Cocoa

// Booleans
// ********

/* booleans are a type, it can be true of false
 yesterday there was actually some booleans */
let fileName = "paris.jpg"
print(fileName.hasSuffix(".jpg")) // this actually prints a boolean,
// hasSuffix returns a boolean, also isMultiple(of:)

let goodDogs = true // declaring a constant with boolean value true
let isMultiple = 12.isMultiple(of: 3) // declaring a boolean constant from a function

//two ways to change the turth value of a boolean
var isAuthenticated = false //declaring a variable of false boolean
isAuthenticated = !isAuthenticated // invert the truth value of the variable and assign the new value
print(isAuthenticated) // now it should print true
isAuthenticated.toggle() // toggle back the value of isAuthenticated
print(isAuthenticated) //this should print false


// Joining string
// **************

let people = "Haters"
let action = "hate"
let lyrics = people + " gonna " + action //concatenating string with +, with string + is not addition
// overloading: an operation can act differently on different type

let luggageCode = "1" + "2" + "3" + "4" + "5" // don't do this, too much +, its innefective
/* everytime we use + with string we actually create a new string,
 so above we created unused new string on every + */

//use string interpolation instead
let message = "well all \(people) are just gonna \(action) for some reason."
// it's more efficient and work for all kinds of type

//remember, + doesn't work fir mixed type, hence use convertion
var missionMessage = "The Apollo " + String(11) + " landed on the moon."

//but again it's better to use string interpolation
missionMessage = "The Apollo \(11) landed on the moon."

//you can also have operation inside string interpolation
print("3 times 4 equals to \(3 * 4).")

/*string interpolation is usefull for showing variable data,
 string that cahnge depending on the situtation, like the city you're currently at.*/


// summary: simple data
// ********************

/*
 1. use let and var to decleare constant and data (use let if your data won't change)
 2. string works with any language and also emoji, it also has count and upercased()
 3. string is delimited with double quites, multiline string with tripple double quotes
 4. integers are whole number, can be positive, 0, negative, it aslo has isMultiple(of:)
 5. Double can represent large number but not 100% accurate
 6. there are operators such as +, -, *, /, also signment operatos such as +=, -=, etc
 7. boolean value can be flipped using ! or toggle()
 8. string interpolation is efficient unlike concatenation +
 */


// checkpoint 1
// ************

let celsius = 50.0 //constant of temperature in Celsius
let fahrenheit = celsius*9.0/5.0 + 32.0 //constant of Fahrenheit calculated from Celsius
print("Well, \(celsius) ℃ is \(fahrenheit) ℉.")

