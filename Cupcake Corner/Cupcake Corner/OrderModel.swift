//
//  OrderModel.swift
//  Cupcake Corner
//
//  Created by Colten Glover on 10/29/23.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]
    
    @Published var type = 0 //Which index user has chosen
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
}
