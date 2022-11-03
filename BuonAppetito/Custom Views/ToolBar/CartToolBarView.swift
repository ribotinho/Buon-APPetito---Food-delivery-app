//
//  CartToolBarView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct CartToolBarView: View {
    
    @ObservedObject var viewModel : StoreViewModel
    
    var body: some View {
        ZStack{
          
            Rectangle()
                .fill(Color.orange)
                .frame(width: 60, height: 35)
                .cornerRadius(10)
            
            HStack{
                if (viewModel.orders.count > 0) {
                    Text("\(viewModel.orderCount)")
                        .foregroundColor(.white).bold().font(.caption)
                }
                Image(systemName: "cart.fill")
                    .font(.caption)
                    .foregroundColor(Color.white)
            }
            
        }
    }
    
    
}

struct CartToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        CartToolBarView(viewModel: StoreViewModel())
    }
}
