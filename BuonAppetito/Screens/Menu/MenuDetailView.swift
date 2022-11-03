//
//  MenuDetailView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct MenuDetailView: View {
    @ObservedObject var viewModel : StoreViewModel
    @State var item : any StoreItem
    
    var body: some View {
        
        VStack {
            VStack(alignment: .center) {
                
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150, height: 150)
                
            }
            .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(item.type.rawValue.uppercased())
                        .foregroundColor(.secondary)
                    Text(item.name)
                        .font(.title)
                }
                Spacer()
                
                MenuItemStepper(item: $item)
            }
            .padding()
            
            ingredientsView()
            
            Spacer()
            
            AddToCartButton(viewModel: viewModel, item: item)
            
        }
        .toolbar {
            ToolbarItem{
                NavigationLink(destination: CartView(viewModel: viewModel)) {
                    CartToolBarView(viewModel: viewModel)
                }
            }
        }
    }
    
    @ViewBuilder
    func ingredientsView() -> some View {
        
        if let foodItem = item as? FoodItem {
            VStack {
                HStack{
                    StatView(name: "Ratings", value: String(format: "%.1f", foodItem.rating), image: "star.fill", color: .yellow)
                    Spacer()
                    StatView(name: "Calories", value: String("\(foodItem.kcal)kcal"), image: "flame.fill", color: .red)
                    Spacer()
                    StatView(name: "Time", value: String("\(foodItem.preparationTime)m"), image: "clock.fill", color: .orange)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                VStack(alignment: .leading){
                    Text("Ingredients".uppercased())
                        .foregroundColor(.secondary)
                    
                    ForEach(foodItem.ingredients, id: \.self){ ingredient in
                        IngredientView(viewModel: viewModel, item: $item, ingredient: ingredient)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(viewModel: StoreViewModel(), item: DrinkItem.example)
    }
}
