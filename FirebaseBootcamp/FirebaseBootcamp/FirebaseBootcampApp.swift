//
//  FirebaseBootcampApp.swift
//  FirebaseBootcamp
//
//  Created by Colten Glover on 9/19/23.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct FirebaseBootcampApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
