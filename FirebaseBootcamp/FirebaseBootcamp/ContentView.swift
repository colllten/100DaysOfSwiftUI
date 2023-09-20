//
//  ContentView.swift
//  FirebaseBootcamp
//
//  Created by Colten Glover on 9/19/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var errorShowing = false
    @State private var errorMessage = ""
    
    @State var matching = false
    var body: some View {
        Form {
            Section("Email") {
                TextField("", text: $email)
            }
            .keyboardType(.emailAddress)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            
            Section("Password") {
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $confirmPassword)
            }
            
            Button("Submit") {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error {
                        print("showing error")
                        errorShowing = true
                        errorMessage = error.localizedDescription
                        return
                    } else {
                        print("All good!")
                    }
                }
            }
        }
        .alert("Error creating user", isPresented: $errorShowing) {
            Button("OK") {}
        } message: {
            Text(errorMessage)
        }
    }
}

#Preview {
    ContentView()
}
