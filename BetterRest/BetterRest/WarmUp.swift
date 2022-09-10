//
//  ContentView.swift
//  BetterRest
//
//  Created by Asti Widiyaningsih on 10/09/22.
//

import SwiftUI

func getEightAM()-> Date {
    // to have 8 am
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now
    return date
}

let now = Date.now
let tomorrow = Date.now.addingTimeInterval(86400) //adding a day (in second)
let range = now...tomorrow

//taking only hour and minute from some dateComponents
let components2 = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
let hour = components2.hour ?? 0
let minute = components2.minute ?? 0

struct WarmUpView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now

    
    var body: some View {
        VStack(spacing: 30) {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute).labelsHidden()




            //formatting date and time
            //one way
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
}

struct WarmUpView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
