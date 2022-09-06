//
//  ContentView.swift
//  ViewModifierLargeBlue
//
//  Created by Asti Widiyaningsih on 07/09/22.
//

import SwiftUI

struct LargeBlue: ViewModifier {
func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .largeBlue()
    }
}

extension View {
    func largeBlue() -> some View {
        modifier(LargeBlue())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
