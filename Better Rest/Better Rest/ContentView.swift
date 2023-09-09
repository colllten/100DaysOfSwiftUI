//
//  ContentView.swift
//  Better Rest
//
//  Created by Colten Glover on 9/9/23.
//
//  A project demonstrating Picker and CoreML
//

import SwiftUI
import CoreData
import CoreML

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var cupsOfCoffee = 0
    
    static private var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("When do you want to wake up?")
                        DatePicker("Pick a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("How much would you like to sleep?")
                            .font(.headline)
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Daily coffee intake (cups)")
                            .font(.headline)
                        Picker("\(cupsOfCoffee) \(cupsOfCoffee == 1 ? "cup": "cups")", selection: $cupsOfCoffee) {
                            ForEach(0..<11) { cup in
                                Text(cup.formatted())
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
                Section("Your bedtime is") {
                    Text("\(calculateBedtime().formatted(date: .omitted, time: .shortened))")
                }
            }
            .navigationTitle("Better Rest")
        }
    }
    
    func calculateBedtime() -> Date {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSec = (components.hour ?? 0) * 60 * 60
            let minuteInSec = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hourInSec + minuteInSec), estimatedSleep: sleepAmount, coffee: Double(cupsOfCoffee))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
        } catch {
            
        }
        return Date.now
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
