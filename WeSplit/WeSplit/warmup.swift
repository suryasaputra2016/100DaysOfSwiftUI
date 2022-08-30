//
//  ContentView.swift
//  WeSplit
//
//  Created by Asti Widiyaningsih on 28/08/22.
//

import SwiftUI

// structure that conforms to View protocol, is the initial view
struct warmup: View {
    // state property which can be changed even though iside struct
    @State private var tapCount = 0
    
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    // creating discovery
    // computed property of some type that conforms to view
    var body: some View {
        VStack {
         /*
        // text
        Text("Hello, world!")
            // modifier
            .padding()
        // form
        Form{
            Text("Hello, world!")
            Text("Hello, world!")
            // can contain up to 10 components
        }
        // to have more components we can chunck them into groups
        Form {
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            // in thoeory works for any number of integer
        }
        
        // form with section
        Form {
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            // in thoeory works for any number of ingeter
        }
          */
            
        //navigation bar
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI") //title of nav
            .navigationBarTitleDisplayMode(.inline) //make nav title smaller
        }
        
        // button that when tapped increment the tapCount above
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
         

        //text field with binding to name
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello \(name)")
        }
        
         // picker with options from array built with ForEach
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        
        }
    }
        
}


// the code below is just to show preview during development
struct warmup_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
