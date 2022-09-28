//
//  ContentView.swift
//  Edutainment
//
//  Created by Asti Widiyaningsih on 25/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var maxNumbers = 2
    @State private var numberOfQuestions = 5
    @State private var gameStarts = false
    
    var body: some View {
        if gameStarts {
            GameView(
                maxNumbers: $maxNumbers,
                numberOfQuestions: $numberOfQuestions,
                gameStarts: $gameStarts)
        } else {
            chooseView(
                maxNumbers: $maxNumbers,
                numberOfQuestions: $numberOfQuestions,
                gameStarts: $gameStarts)
        }
    }
}

struct chooseView: View {
    @Binding var maxNumbers: Int
    @Binding var numberOfQuestions: Int
    @Binding var gameStarts: Bool
    
    let availableNumber = [5, 10, 15]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Stepper("Up to \(maxNumbers)", value: $maxNumbers, in: 2...12)
                } header: {
                    Text("Choose numbers to be multiplied")
                }
                
                Section {
                    Picker("How many questions", selection: $numberOfQuestions) {
                        ForEach(availableNumber, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Numbers of questions to solve")
                }
                
                HStack {
                    Spacer()
                    Button("Start") {
                        gameStarts = true
                    }.buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Multiplication Game")
        }
    }
}

struct GameView: View {
    @Binding var maxNumbers: Int
    @Binding var numberOfQuestions: Int
    @Binding var gameStarts: Bool
    
    @State private var score = 0
    @State private var questionNumber = 1
    
    func generateNumber()->Int{
        Int.random(in: 1...maxNumbers)
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Score: \(score)")
                }
                
                QuestionView(
                    gameStarts: $gameStarts,
                    score: $score,
                    questionNumber: $questionNumber,
                    numberOfQuestions: $numberOfQuestions,
                    firstNumber: generateNumber(),
                    secondNumber: generateNumber()
                )
            }
            .navigationTitle("Question number \(questionNumber)")
        }
    }
}

struct QuestionView: View {
    @Binding var gameStarts: Bool
    @Binding var score: Int
    @Binding var questionNumber: Int
    @Binding var numberOfQuestions: Int
    
    @State private var answer = 1
    @State private var showAlert = false
    @State private var alertMessage = "Wrong!"
    @State var firstNumber: Int
    @State var secondNumber: Int
    
    var body: some View {
        Group {
            Section {
                Text("What is \(firstNumber) x \(secondNumber)?")
            }
            
            Section {
                TextField("Your answer", value: $answer, format: .number)
                    .multilineTextAlignment(.center)
            } header : {
                Text("Your answer")
            }
            
            HStack {
                Spacer()
                Button("Answer") {
                    if questionNumber >= numberOfQuestions {
                        // show alert
                        gameStarts = false
                    }
                    questionNumber += 1
                    if answer == firstNumber * secondNumber {
                        score += 1
                        alertMessage = "Correct"
                    } else {
                        alertMessage = "Wrong"
                    }
                    showAlert = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Text("You're correct")
            Button("Ok") {
                firstNumber = 3
                secondNumber = 4
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
