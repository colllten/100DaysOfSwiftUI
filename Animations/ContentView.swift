//
//  ContentView.swift
//  Animations
//
//  Created by Colten Glover on 9/17/23.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
        @State private var isShowing = false

        var body: some View {
            VStack {
                Button("Tap Me") {
                    withAnimation {
                        isShowing.toggle()
                    }
                }

                if isShowing {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.scale)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
