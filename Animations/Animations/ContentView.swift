//
//  ContentView.swift
//  Animations
//
//  Created by Asti Widiyaningsih on 20/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.00
    
    var body: some View {
        
        Button("Tap me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        /*
         // animation to binding
        print(animationAmount)

        return VStack {
            Stepper("ScaleAmount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()

            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
            Spacer()
        }
         */
        
        /*
         // animation related to value
        Button("Tap me") {
            animationAmount += 1
        }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            
            .overlay(
                Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
            )
            .onAppear {
                animationAmount = 2
            }
         */
        
        
        /*
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1)*3)
            .animation(.easeInOut(duration: 1)
                        .delay(2)
                        .repeatCount(4, autoreverses: true),
                        //.repeatForever(autoreverses: true),
                       value: animationAmount)
            //.animation(.default, value: animationAmount)
            // .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
            // .animation(.easeOut, value: animationAmount)
         */

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
