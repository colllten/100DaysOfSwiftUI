//
//  Guess_The_FlagApp.swift
//  Guess The Flag
//
//  Created by Colten Glover on 9/3/23.
//

import SwiftUI

@main
struct Guess_The_FlagApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
