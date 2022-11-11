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
    @Published var showAlert : Bool = false
    
    func getItems(for type: ItemType) -> [any StoreItem] {
        return items.filter({$0.type == type})
    }
    
    func fetch() {
        items = MockData
    }
    
    func order(item : some StoreItem) {
        
        orderAmount += item.totalPrice
        orderCount += item.quantity
        
        guard let index = orders.firstIndex(where: {$0.name == item.name}) else {
            orders.append(item)
            return
        }

        if item is FoodItem {
            let foodItem = item as! FoodItem
            for index in orders.indices {
                if orders[index].name == item.name {
                    let foodOrder = orders[index] as? FoodItem
                    if foodItem.ingredientsString == foodOrder?.ingredientsString {
                        orders[index].quantity += item.quantity
                        return
                    }
                }
            }
            let newOrder = FoodItem(name: foodItem.name, quantity: foodItem.quantity, price: foodItem.price, kcal: foodItem.kcal, type: foodItem.type, imageName: foodItem.imageName, ingredients: foodItem.ingredients, rating: foodItem.rating, preparationTime: foodItem.preparationTime)
            orders.append(newOrder)
        } else{
            orders[index].quantity += item.quantity
        }
    }
    
    func add(item: some StoreItem){
        
        orderCount += 1
        
        if item is FoodItem {
            let foodItem = item as! FoodItem
            for index in orders.indices {
                if orders[index].name == item.name {
                    let foodOrder = orders[index] as? FoodItem
                    if foodItem.ingredientsString == foodOrder?.ingredientsString {
                        orders[index].quantity += 1
                        orderAmount += foodItem.ingredientsPrice
                        return
                    }
                }
            }
        }else {
            if let index = orders.firstIndex(where: {$0.name == item.name}) {
                orders[index].quantity += 1
                orderAmount += item.totalPrice
             }
        }
    }
    
    func remove(item: some StoreItem){
        orderCount -= 1
        
        if item is FoodItem {
            let foodItem = item as! FoodItem
            for index in orders.indices {
                if orders[index].name == item.name {
                    let foodOrder = orders[index] as? FoodItem
                    if foodItem.ingredientsString == foodOrder?.ingredientsString {
                        orders[index].quantity -= 1
                        orderAmount -= foodItem.ingredientsPrice
                        return
                    }
                }
            }
        }else {
            if let index = orders.firstIndex(where: {$0.name == item.name}) {
                orders[index].quantity -= 1
                orderAmount -= item.totalPrice
             }
        }
    }
    
    func removeAll(item: some StoreItem){
        
        orderCount -= item.quantity
        orderAmount -= item.totalPrice
        
        if item is FoodItem {
            let foodItem = item as! FoodItem
            for index in orders.indices {
                if orders[index].name == item.name {
                    let foodOrder = orders[index] as? FoodItem
                    if foodItem.ingredientsString == foodOrder?.ingredientsString {
                        orders.remove(at: index)
                        return
                    }
                }
            }
        }else {
            if let index = orders.firstIndex(where: {$0.name == item.name}) {
                orders.remove(at: index)
             }
        }
    }
}


//MARK: - Mock Data
let MockData : [any StoreItem] = [
    FoodItem(name: "BBQ Pizza", quantity: 1, price: 14.5, kcal: 1500, type: .pizza, imageName: "pizza-bbq", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Mushroom Pizza", quantity: 1, price: 12.5, kcal: 1000, type: .pizza, imageName: "pizza-mushroom", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Seafood Pizza", quantity: 1, price: 17.5, kcal: 1200, type: .pizza, imageName: "pizza-fish", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Veggie pizza", quantity: 1, price: 15, kcal: 1150, type: .pizza, imageName: "pizza-veggie", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Chesse pizza", quantity: 1, price: 10, kcal: 950, type: .pizza, imageName: "pizza-four cheese", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Pepperoni pizza", quantity: 1, price: 10, kcal: 1000, type: .pizza, imageName: "pizza-pepperoni", ingredients: pizzaIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Cheeseburger", quantity: 1, price: 8.5, kcal: 250, type: .burger, imageName: "burger", ingredients: burgerIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Veggie burger", quantity: 1, price: 7.5, kcal: 350, type: .burger, imageName: "burger-veggie", ingredients: burgerIngredients, rating: 4.5, preparationTime: 25),
    FoodItem(name: "Cupcake", quantity: 1, price: 2.5, kcal: 250, type: .dessert, imageName: "cupcake", ingredients: dessertIngredients, rating: 4.1, preparationTime: 25),
    FoodItem(name: "Cake", quantity: 1, price: 5, kcal: 500, type: .dessert, imageName: "cake", ingredients: dessertIngredients, rating: 4.9, preparationTime: 25),
    DrinkItem(name: "Coca-cola", quantity: 1, price: 1.5, kcal: 60, type: .beverage, imageName: "cola"),
    DrinkItem(name: "Water", quantity: 1, price: 1, kcal: 0, type: .beverage, imageName: "water")
]

let pizzaIngredients : [Ingredient] = [
    Ingredient(name: "Jalapeño", imageName: "jalapeno", kcal: 10, price: 0.25),
    Ingredient(name: "Cheese", imageName: "cheese", kcal: 100, price: 1.00),
    Ingredient(name: "Mushrooms", imageName: "mushroom", kcal: 15, price: 0.50),
    Ingredient(name: "Pineapple", imageName: "pineapple", kcal: 25, price: 0.75)
]

let burgerIngredients: [Ingredient] = [
    Ingredient(name: "Tomato", imageName: "tomato", kcal: 10, price: 0.25),
    Ingredient(name: "Lettuce", imageName: "lettuce", kcal: 5, price: 0.10),
    Ingredient(name: "Onions", imageName: "onion", kcal: 10, price: 0.50),
    Ingredient(name: "Extra patty", imageName: "patty", kcal: 150, price:2.50),
]

let dessertIngredients: [Ingredient] = [
    Ingredient(name: "Syrup", imageName: "syrup", kcal: 150, price: 1.50),
    Ingredient(name: "Sprinkles", imageName: "sprinkles", kcal: 50, price: 1.25),
    Ingredient(name: "Whip cream", imageName: "whip-cream", kcal: 75, price: 2.00),
]
