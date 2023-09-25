//
//  ContentView.swift
//  iExpense
//
//  Created by Colten Glover on 9/18/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
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
