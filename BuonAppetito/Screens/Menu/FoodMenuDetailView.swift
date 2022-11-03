//
//  MenuDetailView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct FoodMenuDetailView: View {
    
    @State var item : Food
    
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
                
                //ItemStepper(item: $item)
            }
            .padding()
            
            
            HStack{
                StatView(name: "Ratings", value: String(format: "%.1f", item.rating), image: "star.fill", color: .yellow)
                Spacer()
                StatView(name: "Calories", value: String("\(item.kcal)kcal"), image: "flame.fill", color: .red)
                Spacer()
                StatView(name: "Time", value: String("\(item.preparationTime)m"), image: "clock.fill", color: .orange)
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            VStack(alignment: .leading){
                Text("Ingredients".uppercased())
                    .foregroundColor(.secondary)
                
                ForEach(item.ingredients, id: \.self){ ingredient in
                    //IngredientView(ingredient: ingredient, item: $item)
                    
                }
            }
            .padding(.horizontal)
            
            
            Spacer()
            
            Button {
                print("added")
            } label: {
                ZStack{
                    Capsule()
                        .fill(.orange)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .padding(.horizontal)
                    
                    Label("Add to cart - \(String(format: "%.1f€", item.totalPrice))", systemImage: "cart.fill").foregroundColor(.white).bold()
                    
                }
            }
            
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodMenuDetailView( item: Food.example)
    }
}
