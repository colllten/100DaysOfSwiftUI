//
//  SignInEmailView.swift
//  FirebaseBootcamp
//
//  Created by Colten Glover on 9/20/23.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}



struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .padding(.horizontal)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .padding(.horizontal)
            
            .navigationTitle("Sign In with Email")
        }
    }
}

#Preview {
    NavigationView {
        SignInEmailView()
    }
}
