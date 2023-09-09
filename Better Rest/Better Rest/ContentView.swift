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

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var cupsOfCoffee = 1
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
