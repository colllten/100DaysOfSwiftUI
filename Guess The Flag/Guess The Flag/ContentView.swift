//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Colten Glover on 9/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var questionsAnswered = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .gray], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.bottom)
                        Text("Score: \(score)")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    ForEach(0..<3) { flag in
                        Button {
                            flagTapped(flag)
                        } label: {
                            FlagImage(imageUrl: countries[flag])
                        }
                    }
                    Spacer()
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(scoreMessage)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That is the flag of \(countries[number])"
        }
        //TODO: check how many questions they have had to display
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct FlagImage: View {
    var imageUrl: String
    var body: some View {
        Image(imageUrl)
            .renderingMode(.original)
            .flagStyle()
    }
}

struct FlagStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

extension View {
    func flagStyle() -> some View {
        modifier(FlagStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
