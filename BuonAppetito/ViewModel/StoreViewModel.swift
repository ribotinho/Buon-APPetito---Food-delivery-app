//
//  StoreViewModel.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import Foundation

class StoreViewModel : ObservableObject{
    @Published var items : [any StoreItem] = []
    @Published var order : [any StoreItem] = []
    
    func getItems(for type: ItemType) -> [any StoreItem] {
        return items.filter({$0.type == type})
    }
    
    func fetch() {
        items = MockData
    }
    
    func order(item : any StoreItem) {
        order.append(item)
    }
    
    func orderCount() -> Int {
        return order.map({$0.quantity}).reduce(0, +)
    }

}


let MockData : [any StoreItem] = [
    Food(name: "BBQ Pizza", description: "bqq piza", quantity: 1, price: 14.5, kcal: 1500, type: .pizza, imageName: "pizza-bbq", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Mushroom Pizza", description: "mushroom piza", quantity: 1, price: 12.5, kcal: 1000, type: .pizza, imageName: "pizza-mushroom", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Seafood Pizza", description: "seafood piza", quantity: 1, price: 17.5, kcal: 1200, type: .pizza, imageName: "pizza-fish", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Veggie pizza", description: "veggie piza", quantity: 1, price: 15, kcal: 1150, type: .pizza, imageName: "pizza-veggie", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Chesse pizza", description: "chesse pizza", quantity: 1, price: 10, kcal: 950, type: .pizza, imageName: "pizza-four cheese", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Pepperoni pizza", description: "pepperoni pizza", quantity: 1, price: 10, kcal: 1000, type: .pizza, imageName: "pizza-pepperoni", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Cheeseburger", description: "cheeseburger", quantity: 1, price: 8.5, kcal: 250, type: .burger, imageName: "burger", ingredients: burgerIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Veggie burger", description: "veggie burger", quantity: 1, price: 7.5, kcal: 350, type: .burger, imageName: "burger-veggie", ingredients: burgerIngredients, rating: 4.5, preparationTime: 25),
    Food(name: "Cupcake", description: "cupcake", quantity: 1, price: 2.5, kcal: 250, type: .dessert, imageName: "cupcake", ingredients: dessertIngredients, rating: 4.1, preparationTime: 25),
    Food(name: "Cake", description: "veggie burger", quantity: 1, price: 5, kcal: 500, type: .dessert, imageName: "cake", ingredients: dessertIngredients, rating: 4.9, preparationTime: 25),
    Drink(name: "Coca-cola", description: "coke", quantity: 1, price: 1.5, kcal: 60, type: .beverage, imageName: "cola"),
    Drink(name: "Water", description: "water", quantity: 1, price: 1, kcal: 0, type: .beverage, imageName: "water")
]

let pizzaIngredients : [Ingredient] = [
    Ingredient(name: "Jalapeño", imageName: "jalapeno", price: 2),
    Ingredient(name: "Cheese", imageName: "cheese", price: 2),
    Ingredient(name: "Mushrooms", imageName: "mushroom", price: 1.5),
    Ingredient(name: "Pineapple", imageName: "pineapple", price: 1.5)
]

let burgerIngredients: [Ingredient] = [
    Ingredient(name: "Tomato", imageName: "tomato", price: 2),
    Ingredient(name: "Lettuce", imageName: "lettuce", price: 2),
    Ingredient(name: "Onions", imageName: "onion", price: 2),
    Ingredient(name: "Extra patty", imageName: "patty", price: 2)
]

let dessertIngredients: [Ingredient] = [
    Ingredient(name: "Syrup", imageName: "syrup", price: 1),
    Ingredient(name: "Sprinkles", imageName: "sprinkles", price: 3),
    Ingredient(name: "Whip cream", imageName: "whip-cream", price: 5)
]
