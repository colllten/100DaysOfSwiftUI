//
//  AddView.swift
//  iExpense
//
//  Created by Colten Glover on 9/30/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Expense Name", text: $name)
                
                Picker("Type of Expense", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            
            .navigationTitle("Add New Expense")
            .toolbar(content: {
                Button("Save") {
                    expenses.items.append(ExpenseItem(name: name, type: type, amount: amount))
                    dismiss()
                }
            })
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
