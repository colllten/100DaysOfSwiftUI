//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Colten Glover on 9/18/23.
//

import SwiftUI

@main
struct iExpenseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
