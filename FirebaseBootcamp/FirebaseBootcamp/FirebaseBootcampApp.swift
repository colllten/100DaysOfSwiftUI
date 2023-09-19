//
//  FirebaseBootcampApp.swift
//  FirebaseBootcamp
//
//  Created by Colten Glover on 9/19/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseBootcampApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
