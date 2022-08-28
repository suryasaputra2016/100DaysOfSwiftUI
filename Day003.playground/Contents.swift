import Cocoa

// *****
// Array
// *****

// array are data that can hold 1 or more items together
var names = ["Andy", "Ben", "Charlie"] // variable with type array of string
let numbers = [1, 2, 3, 4, 5] // constant with type array of integer
var measurements = [1.2, 3.3, 4.5] //variable of array of double

// selecting items from an array, notice that the numbering start from 0
print(names[0]) // printing first item of names
print(numbers[3]) //printing the fourth item of numbers
print(measurements[2]) //printing the third item of measurements

//for variable array we can add items to array
names.append("Donny") //adding fourth string to names
names.append("Ed") //adding fifth string to names

//The types of elments in an array must be the same
// measurements.append("chriss") //you can't do this

// names[0] + numbers[1] //this is also forbidden, the type of the array is different

//array has types, we can see it when declaring empty array
var scores = Array<Int>() //declaring empty array of integer
scores.append(100)
scores.append(80)

var directions = Array<String>() //declaring empty array of string
directions.append("north")

var windDirection = [String]() //shorter alternative way to creae empty array of string

var temperature = ["hot"] //giving initial value let swift infer the type of array, that is string
temperature.append("cold")
temperature.append("warm")
print(temperature.count) //similar to string array also has count that store the numbers of items

print(names.count)
names.remove(at: 1) // remove second item on names
print(names.count)
names.removeAll() //remove all items in names
print(names.count)

measurements.contains(3.3) //checking if measurements contains 3.3


print(temperature)
print(temperature.sorted()) // sorting temperature
let reversedTemperature = temperature.reversed()
//declaring a new array assigning it to reversed temperature
print(reversedTemperature) //swift doesn't actually reversed the arrays,
// it just took a note that it to be reversed

//functionality of arays also available for string!


// **********
// Dictionary
// **********

/* array is good for storing sequential items
 But it's unsuitable for storing named field like, name, title and address of employee*/
var employee = ["Alex", "Mr.", "Forest"]
print("Name: \(employee[0])")
print("Address: \(employee[2])")
// above does the job but it's risky, the data can be rearrange or deleted.

// for named field use dictionary instead
var employee2 = ["name": "Alex", "title": "Mr.", "address": "Forest"]
// in a dictionary, instead of numebered, each value item is given key
//each item in a dictionary is a pair of key: value

// new every items has clear names
print("Name: \(employee2["name", default: "Unknown"])") //selecting value by its name called key
// also using default in case the name is not included in the array.
print("Address: \(employee2["address", default: "Unknown"])")

//key value pairs doensn't have to be string
let isAtHome = ["Johny": false, "Alex": true, "Bonny": true]
let isPrime = [1: false, 2: true, 3: true, 4: false]
var archEnemy = [String: String]() //declaring empty array with string: string key: value pair
archEnemy["Batman"] = "Joker" //adding new key value pair to heights

//adding new key value pair with existing key, will override the existing key
archEnemy["Batman"] = "penguin" //now joker is no longer the value of archEnemy["Batman"]

//like array, dictionary also has count and removeAll()


// ***
// Set
// ***

//set is like array but with no duplicates and no order
let people = Set(["Denzel Washington", "Tom Cruise", "Nicholas Cage"]) // declaring set from array
print(people) //the order might be shuffled, also, if any, duplication removed

var people2 = Set<String>() //declaring empty set of string
people2.insert("Denzel Washington") //use insert to add new value to set not append

//the absence of duplication in set is useful if you want uniquness
//the absence of order is also useful, bacause swift actually oder for optimal retrival
//set also have contain(), count, and sorted()


// ****
// enum
// ****

//in same cases using string can be inefficient and prone to error
var selectedDay = "Monday" // say we want to have variable holding a name of a day
selectedDay = "Tuesday" // we can then change it to another day
selectedDay = "January" // but this can happen, instead of day we have month
selectedDay = "Friday " //even worse, some extra space that ruins the name
//also do we need to have all the caharacters to show a day?

// let define a new data typa using enum
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
// Weekday is like boolean that have only two values true or false, but here it has 5 values

//now we can use the newly define enum
var day = Weekday.monday
day = Weekday.tuesday //now it's not prone to errror and more efficient

//a more convenient way to define the enum
enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday //case definition in one line
}

// a more convenient way to use the enum
var day2 = Weekday.monday
day2 = .tuesday //here we ommit Weekday because swift knows from the previous declaration

// enum is a specific and safe way to represent data that has several case

