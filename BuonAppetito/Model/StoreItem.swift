//
//  Food.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 1/11/22.
//

import Foundation

protocol StoreItem : Identifiable {
    var anyHashableID: AnyHashable { get }
    var name : String { get }
    var description : String { get }
    var quantity : Int { get set }
    var price : Double { get }
    var kcal : Int { get }
    var type : ItemType { get }
    var imageName : String { get }
    var totalPrice: Double { get }
    
    mutating func increment()
    mutating func decrement()
}

//MARK: Default implementations
extension StoreItem {
    var anyHashableID: AnyHashable { AnyHashable(id) }
    
    mutating func increment() {
        quantity += 1
    }
    
    mutating func decrement() {
        if quantity >= 1 {
            quantity -= 1
        }
    }
}

enum ItemType : String, CaseIterable {
    case all = "All"
    case pizza = "Pizza"
    case burger = "Burger"
    case dessert = "Dessert"
    case beverage = "Beverage"
    
    var imageName : String {
        switch self {
        case .all:
            return "cutlery"
        case .pizza:
            return "pizza-bbq"
        case .burger:
            return "burger"
        case .dessert:
            return "cupcake"
        case .beverage:
            return "water"
        }
    }
}
