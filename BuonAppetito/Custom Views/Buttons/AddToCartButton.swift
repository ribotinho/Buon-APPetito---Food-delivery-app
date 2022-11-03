//
//  AddToCartButton.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct AddToCartButton: View {
    @ObservedObject var viewModel : StoreViewModel
    var item : any StoreItem
    
    var body: some View {
        Button {
            viewModel.order(item: item)
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
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(viewModel: StoreViewModel(), item: FoodItem.example)
    }
}
