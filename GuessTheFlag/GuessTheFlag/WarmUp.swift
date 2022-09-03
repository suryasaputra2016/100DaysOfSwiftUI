//
//  WarmUp.swift
//  GuessTheFlag
//
//  Created by Asti Widiyaningsih on 04/09/22.
//

import SwiftUI

struct WarmUpView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.1, blue: 0.5)
                .frame(minWidth: 100)
            
            VStack(spacing: 20) {
                
                HStack {
                    Text("Hello")
                    Spacer()
                    Text("World!")
                        
                }
                
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 40)
                        .foregroundColor(.secondary)
                    Text("Hello again, world!")
                        .padding()
                        .foregroundStyle(.tertiary)
                }
                
                LinearGradient(
                    gradient: Gradient(colors: [.red, .green, .blue]),
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
                    .frame(maxHeight: 100)
                
                LinearGradient(
                    gradient: Gradient(stops: [
                        Gradient.Stop(color: .white, location: 0.45),
                        Gradient.Stop(color: .black, location: 0.55),
                    ]),
                    startPoint: .leading, endPoint: .trailing
                )
                    .frame(maxHeight: 100)
                
                RadialGradient(
                    colors: [.blue, .black],
                    center: .center,
                    startRadius: 10,
                    endRadius: 50
                )
                    .frame(maxHeight: 100)
                
                AngularGradient(
                    gradient: Gradient(colors: [.red, .yellow, .green, .blue]),
                    center: .center
                )
                    .frame(maxHeight: 100)
                
                HStack {
                    Button("Show alert") {
                        showingAlert = true
                    }
                    
                    Spacer()
                    
                    Button(role: .destructive) {
                        print("deleting")
                    } label: {
                        Label("Delete", systemImage: "pencil")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }

                
                
            }
            .background(.ultraThinMaterial)
            .padding()
        }
        .ignoresSafeArea()
        .alert("Important", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text("This is the important message")
        }
    }
}

struct WarmUpView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
