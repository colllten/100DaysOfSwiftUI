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
    @State private var wakeUp = Date.now
    @State private var cupsOfCoffee = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Pick a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding(.bottom)
                
                Text("How much would you like to sleep?")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    .padding(.bottom)
                
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(cupsOfCoffee) \(cupsOfCoffee == 1 ? " cup" : " cups")", value: $cupsOfCoffee, in: 1...10, step: 1)
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSec = (components.hour ?? 0) * 60 * 60
            let minuteInSec = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hourInSec + minuteInSec), estimatedSleep: sleepAmount, coffee: Double(cupsOfCoffee))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Problem calculating your bedtime"
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
