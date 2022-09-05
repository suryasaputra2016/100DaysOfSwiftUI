//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Asti Widiyaningsih on 06/09/22.
//

import SwiftUI

// SwiftUI uses struct instead of class
// it's more performant and more clean
// no extra inherited properties
// it makes us think in functional design approach

//swiftUI relies on opaque type
//by knowing exactly what the view is, it's more performant
// but usually, we don't know the exact type of the view
// VIewContainers, like VStack can contain TupleView
// TupleView can contain up to 10 views
// we can send multiple view to body
// body has special attribute called @ViewBuilder
// it silently wrap multiple views into TupleView

//view composition
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

// view modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// custom container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { col in
                        content(row, col)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    let motto1 = Text("Draco Dormiens")
    let motto2 = Text("Nunquam Titilandus")
    
    // view properties
    // group is view container that will conforms to the caller
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obiviate")
        }
    }
    
    //or you can have @ViewBuilder
    @ViewBuilder var spells2: some View {
            Text("Lumos")
            Text("Obiviate")
    }

    
    var body: some View {
        /*
         //there is nothing behind our view
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
         */
        
        /*
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
         */
        
        /*
         //modifier actually a new view witth the change
         //the order of the modifiers matters
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.green)
            .padding()
            .background(.blue)
            .padding()
            .background(.yellow)
         */
        
        /*
        Button("Hello, World") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
        // you can also use if else containing the Button, but it's slower
         */
        
        /*
        //environment modifiers are applied to views
        // it has less priority than the child's view, like font modifier below
        // but some modifier like blur only ad
        VStack {
            Text("Gryffindor")
            Text("Hufflepuff")
                .font(.largeTitle)
                .blur(radius: 0)
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 2)
         */
        
        /*
        //we can create view as property
        // even with modifiers
        VStack{
            motto1
                .foregroundColor(.red)
            motto2
        }
        //you can't create stored propertis referring to other stored ones
        // but you can create computed properties
         */
        
        /*
        // we can compose view with no performant cost
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
        */
        
        /*
        // we can have view modifier
        VStack {
            Text("Hello, world")
                .modifier(Title())
            // we can define the modifier in extension to make shorter to call
            Text("Hello, world")
                .titleStyle()
            
        }
         */
        
        //we can also define custom container
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R \(row) C \(col)")
        }
        
    }
}

//our extension on View
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
