//
//  Pizza.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 1/11/22.
//

import Foundation

struct FoodItem : StoreItem {
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
    var totalKcal : Int {
        return kcal + ingredients.map{ $0.quantity > 0 ? $0.kcal : 0}.reduce(0, +)
    }
    
    var totalPrice : Double {
        let amount = price + ingredients.map({$0.quantity > 0 ? $0.price : 0}).reduce(0, +)
        return amount  * Double(quantity)
    }
    
    mutating func addIngredient(ingredient : Ingredient){
        if let index = ingredients.firstIndex(where: {$0.name == ingredient.name}) {
            ingredients[index].quantity += 1
        }
    }
    
    mutating func removeIngredient(ingredient : Ingredient){
        if let index = ingredients.firstIndex(where: {$0.name == ingredient.name}) {
            ingredients[index].quantity -= 1
        }
    }
}

extension FoodItem {
    static let example = FoodItem(name: "BBQ Pizza", description: "", quantity: 1, price: 14.5, kcal: 1, type: .pizza, imageName: "pizza-bbq", ingredients: [], rating: 4.5, preparationTime: 10)
}
