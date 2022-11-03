//
//  Pizza.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 1/11/22.
//

import Foundation

struct Food : StoreItem {
    var id: UUID = UUID()
    var name: String
    var description: String
    var quantity: Int
    var price: Double
    var kcal: Int
    var type: ItemType
    var imageName: String
    
    var ingredients : [Ingredient]
    var rating : Double
    var preparationTime : Int
    var isFavorite : Bool = false
    
    var totalPrice : Double {
        return (price  + ingredients.map({$0.totalPrice}).reduce(0, +)) * Double(quantity)
    }
}

extension Food {
    static let example = Food(name: "BBQ Pizza", description: "", quantity: 1, price: 14.5, kcal: 1, type: .pizza, imageName: "pizza-bbq", ingredients: [], rating: 4.5, preparationTime: 10)
}
