//
//  ContentView.swift
//  WeSplit
//
//  Created by Asti Widiyaningsih on 28/08/22.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPecentage = 20
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPecentage)
        
        let tipValue = checkAmount*tipSelection/100
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .focused($amountIsFocused)
                    .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPecentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson,
                         format: .currency(code: Locale.current.currencyCode ??  "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
        
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
