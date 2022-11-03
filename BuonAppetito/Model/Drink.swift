//
//  Drink.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import Foundation

struct Drink : StoreItem {

    var id: UUID = UUID()
    var name: String
    var description: String
    var quantity: Int
    var price: Double
    var kcal: Int
    var type: ItemType
    var imageName: String
    
    var totalPrice : Double {
        return price  * Double(quantity)
    }
}

extension Drink {
    static let example = Drink(name: "Water", description: "", quantity: 1, price: 1, kcal: 0, type: .beverage, imageName: "water")
}
