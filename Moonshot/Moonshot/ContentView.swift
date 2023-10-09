//
//  ContentView.swift
//  Moonshot
//
//  Created by Colten Glover on 10/3/23.
//

import SwiftUI


struct ContentView: View {
    let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text(astronauts.count, format: .number)
                Text(missions.count, format: .number)
            }
        }
    }
}

#Preview {
    ContentView()
}
