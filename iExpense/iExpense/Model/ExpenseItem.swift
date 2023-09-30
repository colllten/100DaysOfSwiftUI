//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Colten Glover on 9/30/23.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
