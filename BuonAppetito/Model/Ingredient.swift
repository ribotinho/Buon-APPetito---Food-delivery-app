//
//  Ingredient.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import Foundation

struct Ingredient : Hashable {
    var name : String
    var quantity : Int = 0
    var imageName : String
    var kcal : Int
    var price : Double
    
    mutating func add(){
        quantity += 1
    }
    
    mutating func remove(){
        quantity -= 1
    }
}

extension Ingredient {
    static let example = Ingredient(name: "Tomato", quantity: 0, imageName: "tomato", kcal: 15, price: 0.15)
}
