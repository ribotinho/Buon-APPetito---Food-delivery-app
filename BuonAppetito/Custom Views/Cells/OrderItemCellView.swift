//
//  OrderItemCellView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 3/11/22.
//

import SwiftUI

struct OrderItemCellView: View {
    @ObservedObject var viewModel : StoreViewModel
    @State var item : any StoreItem
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .fill(.white)
                .cornerRadius(10)
            
            HStack{
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:50, height: 50)
                    .padding(.leading)
                
                VStack (alignment: .leading){
                    Text("\(item.name) - \(String(format: "%.1f €", item.totalPrice))")
                        .bold()
                        .padding(.bottom, 4)
                    //Text("\(String(format: "%.1f €", item.totalPrice))")
                    
                    HStack {
                        stepper()
                        Spacer()
                        Image(systemName: "trash.fill")
                            .foregroundColor(.orange)
                            .font(.title)
                            .padding(.trailing)
                            .onTapGesture {
                                viewModel.remove(item: item)
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
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
                        if item.quantity >= 1 { item.quantity -= 1 }
                    }
                
                Text("\(item.quantity)")
                    .bold()
                    .padding(.horizontal, 10)
                
                Image(systemName: "plus")
                    .foregroundColor(.gray)
                    .frame(height:30)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        item.quantity += 1
                    }
            }
            
        }
        
        
    }
}

struct OrderItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemCellView(viewModel: StoreViewModel(), item: Food.example)
    }
}
