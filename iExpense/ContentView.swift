//
//  ContentView.swift
//  iExpense
//
//  Created by Colten Glover on 9/18/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Colten"
    @Published var lastName = "Glover"
}

struct SecondView: View {
    @Environment(\.dismiss) var dimiss
    let name: String
    var body: some View {
        Button("Dimiss") {
            dimiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Form {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet, content: {
                SecondView(name: "Colten")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
