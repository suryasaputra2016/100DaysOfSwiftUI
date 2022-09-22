//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Asti Widiyaningsih on 04/09/22.
//

import SwiftUI

struct flagImage: View {
    let country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
    
}

/*
// to be defined later,
 // make conditional viewmodifier with extension
 // use it in place of modifier on the chosen and unchosen flag
 
 struct chosen: ViewModifier {
    @State private var angle: Double
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(Angle.degrees(angle), axis: (x: 0, y: 1, z: 0))
    }
}

struct notChosen: ViewModifier {
    @State private var opacity: Double
    @State private var blurRadius: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .blur(radius: blurRadius)
    }
}
 */



struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingEndGame = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var count = 1
    @State private var countDisplay = 1
    
    @State private var chosen = 0
    
    @State private var angle = 0.0
    @State private var opacity = 1.0
    @State private var blurRadius = 0.0
    
    let numberOfGame = 3

    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45),
                        location: 0.3),
                    .init(
                        color: Color(red: 0.76, green: 0.15, blue: 0.26),
                        location: 0.3),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()

        
            
            
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        VStack{
                            Text("Question \(countDisplay)/\(numberOfGame):")
                            Text("Tap the flag of")
                        }
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        } label: {
                            if chosen == number {
                                flagImage(country: countries[number])
                                    .rotation3DEffect(Angle.degrees(angle), axis: (x: 0, y: 1, z: 0))
                            } else {
                                flagImage(country: countries[number])
                                    .opacity(opacity)
                                    .blur(radius: blurRadius)
                            }
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Your score is \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert(scoreTitle, isPresented: $showingEndGame) {
                Button("Reset game", action: reset)
            } message: {
                VStack{
                    Text("The game has ended.\nYour total score is \(score)/\(count-1)")
                }
                
            }
            .padding()
        }
    }
    
    func flagTapped(_ number: Int) {
        chosen = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
        }
        
        count += 1
        if count <= numberOfGame {
            showingScore = true
        } else {
            showingEndGame = true
        }
        
        withAnimation {
            angle += 360.0
            opacity = 0.25
            blurRadius = 5.0
        }
    }
    
    func askQuestion() {
        countDisplay += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        angle = 0.0
        opacity = 1.0
        blurRadius = 0.0
    }
    
    func reset() {
        score = 0
        count = 1
        countDisplay = 0
        showingEndGame = false
        askQuestion()
    }
    
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 1a3")
    }
}

