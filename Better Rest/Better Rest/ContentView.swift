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
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                DatePicker("", selection: $wakeUp, in: Date.now...)
                    .labelsHidden()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
