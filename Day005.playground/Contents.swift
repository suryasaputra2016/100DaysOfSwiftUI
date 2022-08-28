import Cocoa

// **********************
// checking true or false
// **********************

let score = 85

// if prepare swift to check the condition following it
// here the condition is whther score is greater than 80
// if the condition is satisfied then the line inside the curly braces is executed
//
if score > 80 {
    print("Great work!")
}

// using > (greater than), < (less than), >= (greater than or equal), <= (less than or equal)
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 { //true
    print("too fast") // it will be executed
}

if percentage < 85 { //false
    print("failed") // won't be executed
}

if age >= 18 { // true
    print("you're an adult") //will be executed
}


// printing names alphabetically

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}


// array of maximum 3 items
var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 { // if there are more than 3 items in the array
    numbers.remove(at: 0) //remove the first item
}
print(numbers)

// using == (equality check) and != (inequality check)
let country = "Australia"

if country == "Australia" {
    print("G'day")
}

if country != "England" {
    print("You're not from England")
}

var userName = "Albert Einstein"

/* if userName is empty then it is changed to Anonymous
 for the checks we can use userName =="" which is slow,
 or we can use userName.count == 0, which also slows (because string can contain emoji)
 a better way is to use usernName.isEmpty == true, buat even better is to use the following
 */
if userName.isEmpty {
    userName = "Anonymous"
}
print("Hello \(userName)!")

// many data types ar ecomparable in swift
// we can also make enum comparable

enum Sizes: Comparable {
    case small, medium, large
}
print(Sizes.small > Sizes.large) // small is less than large because small comes earlier


// **************
// multiple check
// **************

// we can make swift execute some other statements when the condition of if is false
let yourAge = 16

if yourAge > 16 {
    print("you're good to go")
} else { // this block after else will be executed if the condition after if is false
    print("you're too little")
}

// we can also have multiple checking condition
let a = true
let b = false

if a { //first check
    print("a is true") // will be printed if the first check is passed
} else if b { // second check
    print("a is false, but b is true") // will be printed the first check is fail, but not the second
} else {
    print("both a and b are false") // will be printed if the two previous checks fail
}
// you can add as many else if as you want

// to use multiple condition you can use nested if
let temp = 25
if temp > 20 {
    if temp < 30 {
        print("It's a nice day")
    }
}

//or you can combine the conditional statement using and (&&)
if temp > 20 && temp < 30 {
    print("It's a nice day")
}

// logical and is &&, logical or is ||
let userAge = 14
let parentalConsent = true

if userAge >= 18 || parentalConsent {
    print("You can buy the game.")
}

//complex example, using enum
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane //first you need the defined type, next you may skip it

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there is bike park.")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("Scooter time!")
}
// for mix || and && operation use parentheses to make things clear.


// ******
// switch
// ******

enum Weather {
    case sun, rain, wind, snow, unknown
}

//you can use if else if as many time as you like

let forecast = Weather.sun

if forecast == .sun {
    print("a nice day")
} else if forecast == .rain {
    print("bring umbrella")
} else if forecast == .wind {
    print("wear sweater")
} else if forecast == .snow {
    print("stay at home")
} else {
    print("unkown weather")
}

// but using many else if is prone to error, and we do checking multiple times
// instead you can use switch

switch forecast {
case .sun:
    print("a nice day")
case .rain:
    print("bring umbrella")
case .wind:
    print("wear sweater")
case .snow:
    print("stay at home")
case .unknown:
    print("unknown weather")
}
// switch is similar with the else if above
// in swift switch must be exhaustive
// also there is no falltrough, it will get out of switch after executing one case

/* switch is ehaustive, so if you're using type with infinite possible value, like string
 you need to use default */
let place = "Metropolis"

switch place {
case "Gotham":
    print("you're batman")
case "Wakanda":
    print("you're black phanter")
default:
    print("who are you?") //runs if all previous cases failed
}

//if you want to fallthrough,  use fallthrough
let day = 5
print("my true love gave me")

switch day {
case 5:
    print("5 goldern rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 french hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("1 chichek nugget")
}

// fallthorugh is rarely used
// use switch if you need to check the same thing three times or more


// ****************************
// ternary conditional operator
// ****************************

/*ternary operator uses three input
 one condition, two values
 it checks whether the first one is true
 if so it returns the second value,
 if not it returns the third
*/

let hisAge = 18

let canVote = hisAge >= 18 ? true : false //check if age is at least 18
// return true if it is, false if it isn't.

let hour = 23
print(hour > 12 ? "Before noon" : "After noon")

let names = ["alex", "Ben"]
print(names.isEmpty ? "no one" : "there are \(names.count) people")

// this one is a little bit harder to read
enum Theme {
    case light, dark
}
let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

// ternary works like if else statement, but it's shorter and more flexible
// ita can works inside print, or example
