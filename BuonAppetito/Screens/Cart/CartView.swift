//
//  CartView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel : StoreViewModel
    @Binding var selectedTab : Int
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(UIColor.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                if viewModel.orders.count == 0 {
                    ZStack{
                        Image("pizza-bbq")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 500, height: 500)
                            .opacity(0.1)
                        Text("Add an item to the cart")
                            .foregroundColor(.gray)
                            .font(.largeTitle)
                    }
                }else {
                    ZStack{
                        
                        if viewModel.showAlert {
                            OrderCompleteView(viewModel:viewModel, title: "Thank you! 🍕", description: "We are preparing your order and it should be there in no time!")
                                .zIndex(2)
                        }
                        
                        VStack{
                            ScrollView{
                                ForEach(viewModel.orders, id: \.anyHashableID){ order in
                                    OrderItemCellView(viewModel: viewModel, item: order)
                                }
                            }
                            Spacer()
                            
                            subtotal
                            
                            OrderButton(text: "Place Order")
                                .onTapGesture {
                                    viewModel.showAlert = true
                                }
                        }
                    }
                }
            }
            .navigationTitle("Place Order")
        }
    }
    
    var subtotal: some View {
        VStack{
            HStack{
                Text("Selected Items (\(viewModel.orderCount))")
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%.1f €",viewModel.orderAmount))")
                    .foregroundColor(.gray)
                    .bold()
            }
            
            HStack{
                Text("Delivery fee")
                    .foregroundColor(.gray)
                Spacer()
                Text("10.0 €")
                    .foregroundColor(.gray)
                    .bold()
            }
            
            Rectangle()
                .stroke()
                .frame(height: 1)
            
            HStack{
                Text("Subtotal")
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%.1f €",viewModel.orderAmount + 10))")
                    .foregroundColor(.orange)
                    .bold()
            }
        }
        .padding(.horizontal)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: StoreViewModel(), selectedTab: .constant(2))
    }
}
