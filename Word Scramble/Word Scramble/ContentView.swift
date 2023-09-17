//
//  ContentView.swift
//  Word Scramble
//
//  Created by Colten Glover on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = "" //Base word that they must spell others from
    @State private var newWord = "" //Word entered into TextField
    
    var body: some View {
        NavigationView {
            List {
                TextField("Enter your word", text: $newWord)
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.never)
                    .onSubmit(addNewWord)
                Section("Used Words") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Exit if string is empty
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
