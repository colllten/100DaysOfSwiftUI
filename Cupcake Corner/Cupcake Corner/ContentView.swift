//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Colten Glover on 10/25/23.
//

import SwiftUI

enum CodingKeys: CodingKey {
    case name
}

class User: ObservableObject, Codable {
    @Published var name = "Colten"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Look at songs") {
                    AppleSongView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
