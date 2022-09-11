//
//  ContentView.swift
//  BetterRest
//
//  Created by Asti Widiyaningsih on 10/09/22.
//

import CoreML
import SwiftUI


struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0)*60*60
            let minute = (components.minute ?? 0)*60
            
            //prediction is number
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            //we can subtract a date by number and get a date
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is ..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "There was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
    func getBedTime()-> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0)*60*60
            let minute = (components.minute ?? 0)*60
            
            //prediction is number
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            //we can subtract a date by number and get a date
            let sleepTime = wakeUp - prediction.actualSleep
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "There was a problem calculating your bedtime."
        }
        return alertMessage
    }
   
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        DatePicker("Please enter  time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .padding(.vertical)
                    }
                } header: {
                    Text("When do you want to wake up?")
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                        Text("Desired amount of sleep")
                }
                
                Section {
                    Picker((coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups"), selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    
                        Text("Daily coffee intake")
                }
                
                Section {
                    Text("Your ideal bedtime is:")
                    Text(alertMessage)
                        .fontWeight(.bold)
                }.font(.title2)
            }
            .onChange(of: sleepAmount) { _ in
                alertMessage = getBedTime()
            }
            .onChange(of: coffeeAmount) { _ in
                alertMessage = getBedTime()
            }
            .onChange(of: wakeUp) { _ in
                alertMessage = getBedTime()
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }

            }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text(alertMessage)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


/*
 VStack(alignment: .leading, spacing: 0) {
     Text("When do you want to wake up?")
         .font(.headline)
     HStack {
         Spacer()
         DatePicker("Please enter  time", selection: $wakeUp, displayedComponents: .hourAndMinute)
             .labelsHidden()
             .padding(.vertical)
     }
 }
 
 VStack(alignment: .leading, spacing: 0) {
     Text("Desired amount of sleep")
         .font(.headline)
     Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
 }
 
 VStack(alignment: .leading, spacing: 0) {
     Text("Daily coffee intake")
         .font(.headline)
     Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
 */
