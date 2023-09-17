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
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var points = 0
    
    var body: some View {
        NavigationView {
            List {
                TextField("Enter your word", text: $newWord)
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.never)
                    .onSubmit(addNewWord)
                Text("Points: \(points)")
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
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("New Word") {
                    startGame()
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Exit if string is empty
        guard answer.count > 0 else { return }
        
        guard isLongEnough(word: answer) else {
            wordError(title: "Word not long enough", message: "Make longer word")
            return
        }
        
        guard isDifferentWord(word: answer) else {
            wordError(title: "Same word", message: "Be more original")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word already used", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "Some letters are not in root word")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word impossible", message: "You cannot makeup words")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        points += answer.count
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(newWord)
    }
    
    func isDifferentWord(word: String) -> Bool {
        return word != rootWord
    }
    
    func isLongEnough(word: String) -> Bool {
        return word.count > 2
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                newWord = ""
                points = 0
                usedWords.removeAll()
                return
            }
        }
        fatalError("Could not load start.txt in the app bundle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
