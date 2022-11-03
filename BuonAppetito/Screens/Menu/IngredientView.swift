//
//  IngredientView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct IngredientView: View {
    @ObservedObject var viewModel : StoreViewModel
    @Binding var item : any StoreItem
    @State var ingredient : Ingredient
    
    var body: some View {
        HStack{
            Image(ingredient.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:25, height:25)
            Text("\(ingredient.name)")
            
            Spacer()
            
            stepper()
        }
    }
    
    @ViewBuilder
    func stepper() -> some View {
        
        ZStack {
            Capsule()
                .fill(Color(UIColor.secondarySystemBackground.cgColor))
                .frame(width:100, height: 35)
            
            HStack{
                Image(systemName: "minus")
                    .foregroundColor(.gray)
                    .frame(height:30)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if ingredient.quantity >= 1 { ingredient.quantity -= 1 }
                    }
                
                Text("\(ingredient.quantity)")
                    .bold()
                    .padding(.horizontal, 10)
                
                Image(systemName: "plus")
                    .foregroundColor(.gray)
                    .frame(height:30)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        ingredient.quantity += 1
                    }
            }
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(viewModel: StoreViewModel(), item: .constant(FoodItem.example), ingredient: Ingredient.example)
    }
}
