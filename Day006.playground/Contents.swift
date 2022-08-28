import Cocoa

// ****************
// looping with for
// ****************

let vehicles = ["train", "bus", "plane"]

for vehicle in vehicles { //looping through items in vehicles, name each as vehicle
    print(vehicle) //print each item
}

//above, vehicle is loop variable, inside the brace is loop body
// loop body is executed for loop variable equals every items inside vehicle, one after another
// one such cycle is called loop iteration

// try typing "let veh" then tab, if you have array named vehicles xcode will autocomplete

//looping over some integers
for i in 1...5 {
    print("2 x \(i) = \(2*i)")
}
// above i (or j, k) is conventional name for integer in iteration
// also 1...10 is range whch is numbers from 1 to 10, it is its own data type

//loop inside loop
for i in 1...5 {
    for j in 1...5 {
        print("\(i) x \(j) = \(i * j)")
    }
}

for i in 1..<5 { // this time range starts from 1 up to but not including 5
    print(i)
}
// i..<j is great for 0..<someArray.count

//if you don't want to use the loop variable use _
for _ in 0...2 {
    print("i'll print this 3 times")
}

//range used for taking subarray
print(vehicles[1...2])
//this will print the second and third item

// one sided range
print(vehicles[1...])
//this will print items in the vehicles from the second up, to the end


// ******************
// looping with while
// ******************

var countdown = 3

while countdown >= 0 { //this will check the condition and if it's still true will execute the body
    print(countdown)
    countdown -= 1 //inside loop body there is usually an update for check
} // the program will loop back to while and check the condition

//another type of while
var id = Int.random(in: 1...10) // create a random number from the range]

while id != 3 {
    id = Int.random(in: 1...5)
    print("The id is \(id) change the id until we get 3")
}
print("get the id of \(id)")

//while is usually used if you don't know how many iteration to do, like above
// while loops depends on condition
// meanwhile, for loop is great for looping through some collections such as array, or range


// ****************************
// skip with break and continue
// ****************************

// continue
let files = ["one.jpg", "two.png", "three.jpg"]

for file in files {
    if file.hasSuffix(".png") {
        continue //continue will stop the current iteration and move on to the next iteration
    }
    print(file)
}

// break
for file in files {
    if file.hasSuffix(".png") {
        break //break will stop the whole iteration
    }
    print(file)
}
print("after iteration")

// another example of break
for i in 1...1_000_000 {
    if i*i == 16 {
        break // stop if i squared equals 16
    }
    print(i, terminator: " ") //add space after print instead of newline
}
print("")


// *******
// summary
// *******

/*
 1. use if to check if condition is true or false
 2. you can add else if or just else if you want to have a block executed for alternative condition
 3. you can use || and && to combine booleans
 4. repeating else if can be changed into switch case
 5. use fallthrough in switch if you want one
 6. use ternary condition iw you want short if else condition, or use it inside function
 7. use for to loop over array or range use _ if you don't use the variable loop
 8. use while if you want to repeat until certain condiiton is met
 9. skip one iteration or stop the whole iteration using continue and break
 */

// ************
// checkpoint 3
// ************

//the fizzbuzz test
for i in 1...100 {
    if i.isMultiple(of: 3) {
        print(i.isMultiple(of: 5) ? "FizzBuzz" : "Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
