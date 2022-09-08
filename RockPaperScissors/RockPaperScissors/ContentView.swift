//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Asti Widiyaningsih on 08/09/22.
//

import SwiftUI

enum Moves: String, CaseIterable {
    case rock = "🪨"
    case paper = "📄"
    case scissors = "✂️"
    
    static func random()->Moves {
        let i = Int.random(in: 0...2)
        switch i {
        case 0: return .rock
        case 1: return .paper
        default: return .scissors
        }
    }
}

struct ContentView: View {
    func reset() {
        appChoice = Moves.random()
        questionNumber = 1
        score = 0
    }
    
    func addScore() {
        score += 1
        scoreMessage = "Correct!"
        isUpdateScore = true
    }
    
    func subtractScore() {
        score -= 1
        scoreMessage = "Wrong!"
        isUpdateScore = true
    }
    
    func updateScore(choice: Moves) {
        switch appChoice {
        case .paper:
            if (shouldWin && choice == .scissors) || (!shouldWin && choice == .rock){
                addScore()
            } else {
                subtractScore()
            }
        case .rock:
            if (shouldWin && choice == .paper) || (!shouldWin && choice == .scissors){
                addScore()
            } else {
                subtractScore()
            }
        case .scissors:
            if (shouldWin && choice == .rock) || (!shouldWin && choice == .paper){
                addScore()
            } else {
                subtractScore()
            }
        }
    }
    
    @State private var appChoice = Moves.random()
    @State private var shouldWin = Bool.random()
    @State private var yourChoice = Moves.scissors
    
    @State private var questionNumber = 1
    @State private var score = 0
    let totalQuestion = 4
    
    @State private var isUpdateScore = false
    @State private var scoreMessage = ""
    @State private var isEndGame = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                HStack(spacing: 40) {
                    VStack {
                        Text("Score")
                        Text("\(score)")
                    }
                    if !isEndGame {
                        VStack {
                            Text("Question")
                            Text("\(questionNumber)/\(totalQuestion)")
                        }
                    }
                }
                Text("Apps' move: \(appChoice.rawValue)")
                Text("You should: " + (shouldWin ? "win" : "lose"))
                
                Spacer()
                
                Section {
                    HStack {
                        ForEach(Moves.allCases, id: \.self) {
                            let temp = $0
                            Button($0.rawValue) {
                                updateScore(choice: temp)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                } header: {
                    Text("Choose your move").font(.subheadline)
                }
                Spacer()
                Spacer()
            }
            .font(.title)
            .navigationTitle("Rock, Paper, Scissors")
            .alert(scoreMessage, isPresented: $isUpdateScore) {
                Button("Ok") {
                    questionNumber += 1
                    appChoice = Moves.random()
                    shouldWin.toggle()
                    if questionNumber > totalQuestion {
                        isEndGame = true
                    }
                }
            } message: {
                Text("Your score is \(score)")
            }
            .alert("End of The Game", isPresented: $isEndGame) {
                Button("Reset game", action: reset)
            } message: {
                Text("The game has Ended, your score is \(score)")
            }
        }
    }
}
                


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
