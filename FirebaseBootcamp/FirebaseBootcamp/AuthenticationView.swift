//
//  ContentView.swift
//  FirebaseBootcamp
//
//  Created by Colten Glover on 9/19/23.
//

import SwiftUI
import FirebaseAuth

struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                CreateUserEmailView()
            } label: {
                Text("Create User with Email")
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            NavigationLink {
                CreateUserEmailView()
            } label: {
                Text("Sign in with Email")
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .navigationTitle("Sign In")
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
