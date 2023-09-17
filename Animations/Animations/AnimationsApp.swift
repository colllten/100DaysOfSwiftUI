//
//  AnimationsApp.swift
//  Animations
//
//  Created by Colten Glover on 9/17/23.
//

import SwiftUI

@main
struct AnimationsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
