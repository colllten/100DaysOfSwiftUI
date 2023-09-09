//
//  Better_RestApp.swift
//  Better Rest
//
//  Created by Colten Glover on 9/9/23.
//

import SwiftUI

@main
struct Better_RestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
