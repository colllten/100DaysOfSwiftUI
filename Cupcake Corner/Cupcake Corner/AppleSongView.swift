//
//  AppleSongView.swift
//  Cupcake Corner
//
//  Created by Colten Glover on 10/25/23.
//

import SwiftUI

struct AppleSongView: View {
    @State var username = ""
    @State var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    //code
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    AppleSongView()
}
