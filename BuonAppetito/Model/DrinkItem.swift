//
//  Drink.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import Foundation

struct DrinkItem : StoreItem {
    var id: UUID = UUID()
    var name: String
    var quantity: Int
    var price: Double
    var kcal: Int
    var type: ItemType
    var imageName: String
    
    var totalPrice : Double {
        return price  * Double(quantity)
    }
}

extension DrinkItem {
    static let example = DrinkItem(name: "Water", quantity: 1, price: 1, kcal: 0, type: .beverage, imageName: "water")
}
