//
//  ContentView.swift
//  iExpense
//
//  Created by Colten Glover on 9/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                })
            }
            .toolbar(content: {
                Button {
                    expenses.items.append(ExpenseItem(name: "Test", type: "Person", amount: 5))
                } label: {
                    Image(systemName: "plus")
                }
            })
            .navigationTitle("Expenses")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
