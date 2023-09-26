//
//  ContentView.swift
//  iExpense
//
//  Created by Colten Glover on 9/18/23.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Colten", lastName: "Glover")
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Save User") {
                    let encoder = JSONEncoder()
                    if let data = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "UserData")
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
