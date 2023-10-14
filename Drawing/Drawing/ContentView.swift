//
//  ContentView.swift
//  Drawing
//
//  Created by Colten Glover on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    var body: some View {
        Image("armstrong")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(amount)
            .blur(radius: (1 - amount) * 90)
        Slider(value: $amount)
    }
}

#Preview {
    ContentView()
}
