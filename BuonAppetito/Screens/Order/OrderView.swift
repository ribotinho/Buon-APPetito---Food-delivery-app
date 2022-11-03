//
//  OrderView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var viewModel : StoreViewModel
    
    var body: some View {
        VStack{
            ForEach(viewModel.order, id: \.anyHashableID){ order in
                Text(order.name)
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: StoreViewModel())
    }
}
