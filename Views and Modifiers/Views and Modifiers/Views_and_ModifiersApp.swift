//
//  Views_and_ModifiersApp.swift
//  Views and Modifiers
//
//  Created by Colten Glover on 9/5/23.
//

import SwiftUI

@main
struct Views_and_ModifiersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
