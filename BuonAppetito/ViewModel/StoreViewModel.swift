//
//  StoreViewModel.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import Foundation

class StoreViewModel : ObservableObject{
    @Published var items : [any StoreItem] = []
    @Published var orders : [any StoreItem] = []
    @Published var orderCount : Int = 0
    @Published var orderAmount : Double = 0
    
    func getItems(for type: ItemType) -> [any StoreItem] {
        return items.filter({$0.type == type})
    }
    
    func fetch() {
        items = MockData
    }
    
    func order(item : any StoreItem) {
        
        orderAmount += item.price * Double(item.quantity)
        orderCount += item.quantity
        
        if let index = orders.firstIndex(where: {$0.name == item.name}){
            print("adding \(item.quantity) items that currently has \(orders[index].quantity)")
            orders[index].quantity += item.quantity
        }else {
            print("adding new item")
            orders.append(item)
        }
    }
    
    func remove(item: any StoreItem){
        if let index = orders.firstIndex(where: {$0.name == item.name}) {
            orders[index].quantity -= 1
            orderCount -= 1
            orderAmount -= item.price
        }
    }
    
    func removeAll(item: any StoreItem){
        if let index = orders.firstIndex(where: {$0.name == item.name}) {
            orders.remove(at: index)
            orderCount -= item.quantity
            orderAmount -= item.price * Double(item.quantity)
        }
    }
}


let MockData : [any StoreItem] = [
    FoodItem(name: "BBQ Pizza", description: "bqq piza", quantity: 1, price: 14.5, kcal: 1500, type: .pizza, imageName: "pizza-bbq", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Mushroom Pizza", description: "mushroom piza", quantity: 1, price: 12.5, kcal: 1000, type: .pizza, imageName: "pizza-mushroom", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Seafood Pizza", description: "seafood piza", quantity: 1, price: 17.5, kcal: 1200, type: .pizza, imageName: "pizza-fish", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Veggie pizza", description: "veggie piza", quantity: 1, price: 15, kcal: 1150, type: .pizza, imageName: "pizza-veggie", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Chesse pizza", description: "chesse pizza", quantity: 1, price: 10, kcal: 950, type: .pizza, imageName: "pizza-four cheese", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Pepperoni pizza", description: "pepperoni pizza", quantity: 1, price: 10, kcal: 1000, type: .pizza, imageName: "pizza-pepperoni", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Cheeseburger", description: "cheeseburger", quantity: 1, price: 8.5, kcal: 250, type: .burger, imageName: "burger", ingredients: burgerIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Veggie burger", description: "veggie burger", quantity: 1, price: 7.5, kcal: 350, type: .burger, imageName: "burger-veggie", ingredients: burgerIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Cupcake", description: "cupcake", quantity: 1, price: 2.5, kcal: 250, type: .dessert, imageName: "cupcake", ingredients: dessertIngredients, rating: 4.1, preparationTime: 25),
    FoodItem(name: "Cake", description: "veggie burger", quantity: 1, price: 5, kcal: 500, type: .dessert, imageName: "cake", ingredients: dessertIngredients, rating: 4.9, preparationTime: 25),
    DrinkItem(name: "Coca-cola", description: "coke", quantity: 1, price: 1.5, kcal: 60, type: .beverage, imageName: "cola"),
    DrinkItem(name: "Water", description: "water", quantity: 1, price: 1, kcal: 0, type: .beverage, imageName: "water")
]

let pizzaIngredients : [Ingredient] = [
    Ingredient(name: "Jalapeño", imageName: "jalapeno"),
    Ingredient(name: "Cheese", imageName: "cheese"),
    Ingredient(name: "Mushrooms", imageName: "mushroom"),
    Ingredient(name: "Pineapple", imageName: "pineapple")
]

let burgerIngredients: [Ingredient] = [
    Ingredient(name: "Tomato", imageName: "tomato"),
    Ingredient(name: "Lettuce", imageName: "lettuce"),
    Ingredient(name: "Onions", imageName: "onion"),
    Ingredient(name: "Extra patty", imageName: "patty")
]

let dessertIngredients: [Ingredient] = [
    Ingredient(name: "Syrup", imageName: "syrup"),
    Ingredient(name: "Sprinkles", imageName: "sprinkles"),
    Ingredient(name: "Whip cream", imageName: "whip-cream")
]
