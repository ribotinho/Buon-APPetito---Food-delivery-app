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
    @State var addButtonTapped : Bool = false
    @State var notificationXOffset : CGFloat = 0
    @State var notificationYOffset : CGFloat = -500
    @Binding var selectedTab : Int
    
    var body: some View {
        
        ZStack{
            
            notificationView()
            
            VStack {
                VStack(alignment: .center) {
                    
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:125, height: 125)
                    
                }
                
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
                .padding(.horizontal)
                
                ingredientsView()
                
                
                addtoCartButton()
                
                
            }
            .toolbar {
                ToolbarItem{
                        CartToolBarView(viewModel: viewModel)
                        .onTapGesture {
                            selectedTab = 2
                        }
                    
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
    
    @ViewBuilder
    func addtoCartButton() -> some View {
        
        Button {
            withAnimation{
                notificationYOffset = -384
            }
            withAnimation(Animation.linear.delay(1)){
                addButtonTapped = true
            }
            withAnimation(.linear.delay(2)){
                notificationXOffset = 150
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                viewModel.order(item: item)
                notificationXOffset = 0
                notificationYOffset = -500
                addButtonTapped = false
            }
        } label: {
            ZStack{
                Capsule()
                    .fill(.orange)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.horizontal)
                
                Label("Add to cart - \(String(format: "%.1f€", item.totalPrice))", systemImage: "cart.fill")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
    @ViewBuilder
    func notificationView() -> some View {
        HStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            if !addButtonTapped {
                Text("added to cart")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .frame(width: addButtonTapped ? 30 : 150)
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
        .background(Capsule().fill(.orange))
        .offset(x:notificationXOffset, y: notificationYOffset)
        .opacity(notificationXOffset > 90 ? 0 : 1)
    }
    
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(viewModel: StoreViewModel(), item: DrinkItem.example, selectedTab: .constant(2))
    }
}
