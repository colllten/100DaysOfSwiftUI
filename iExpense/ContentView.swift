//
//  ContentView.swift
//  iExpense
//
//  Created by Colten Glover on 9/18/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
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
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            })
            .navigationTitle("Expenses")
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
