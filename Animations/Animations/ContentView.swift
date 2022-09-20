//
//  ContentView.swift
//  Animations
//
//  Created by Asti Widiyaningsih on 20/09/22.
//

import SwiftUI

struct cornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

struct ContentView: View {
    /*
    @State private var animationAmount = 0.00
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    */
    
    @State private var isShowingRed = false
    
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        /*
        // transition
        VStack {
            Button("Tap me") {
                withAnimation(.easeIn(duration: 2)) {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    //.transition(.scale)
            }
        }
         */
        
        /*
        // gesture animation
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading , endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            dragAmount =  .zero
                        }
                    }
            )
            //.animation(.spring(), value: dragAmount)
         */
        
        /*
         //multiple animation for different properties
        Button("Tap me") {
            enabled.toggle()
        }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
            //.animation(nil, value enabled)
         */
        
        /*
         // with animation (explicit animation)
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
         */
        
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

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: cornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: cornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
