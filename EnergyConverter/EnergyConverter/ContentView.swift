//
//  ContentView.swift
//  EnergyConverter
//
//  Created by Asti Widiyaningsih on 02/09/22.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var inputIsFocused
    
    @State private var input = 1.0
    @State private var inputUnit = Unit.joule
    @State private var outputUnit = Unit.calorie
    
    func toJoule()-> Double {
        switch inputUnit {
            case .joule: return input
            case .calorie: return input*4184.0
            case .wh: return input*3600.0
            case .btu: return input*1055.06
        }
    }
    
    func fromJoule(_ inJoule: Double)-> Double {
        switch outputUnit {
        case .joule: return inJoule
        case .calorie: return inJoule/4184.0
        case .wh: return inJoule/3600.0
        case .btu: return inJoule/1055.06
        }
    }
    
    var convertedAmount: Double {
        fromJoule(toJoule())
    }
    
    enum Unit: String, CaseIterable {
        case joule, calorie, wh = "WH", btu = "Btu"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Energy amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(Unit.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Initial value")
                }
                
                Section {
                    Text("\(convertedAmount.formatted())")
                    Picker("Input unit", selection: $outputUnit) {
                        ForEach(Unit.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Converted value")
                }
            }
            .navigationTitle("Energy Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
