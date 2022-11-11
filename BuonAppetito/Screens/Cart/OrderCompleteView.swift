//
//  OrderCompleteView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 3/11/22.
//

import SwiftUI

struct OrderCompleteView: View {
    @ObservedObject var viewModel : StoreViewModel
    var title : String
    var description: String
    
    var body: some View {
        ZStack {
            
            Color.white
                .cornerRadius(15)
            
            VStack{
                VStack(alignment: .center) {
                    Text(title)
                        .foregroundColor(.orange)
                        .bold()
                        .padding(.bottom)
                    
                    Text(description)
                }
                
                Spacer ()
                
                Button {
                    viewModel.showAlert = false
                    viewModel.orders.removeAll()
                } label: {
                    ZStack {
                        Capsule().fill(.orange)
                            .frame(width:200, height: 50)
                        Text("Back")
                            .foregroundColor(.white)
                            .bold()
                    }
                }   
            }
            .padding()
        }
        .frame(width: 150, height: 200)
        .shadow(radius: 10)
    }
}

struct OrderCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompleteView(viewModel: StoreViewModel(), title: "Thank you! 🍕", description: "Your order is on the way!")
    }
}
