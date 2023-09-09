//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Colten Glover on 9/5/23.
//

import SwiftUI
import CoreData

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.green)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Colten")
                .titleStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
