//
//  CartView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel : StoreViewModel
    
    var body: some View {
        VStack{
            ForEach(viewModel.order, id: \.anyHashableID){ order in
                Text(order.name)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: StoreViewModel())
    }
}
