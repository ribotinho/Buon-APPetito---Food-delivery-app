//
//  MenuItemView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct MenuItemCellView: View {
    
    var item : any StoreItem
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 1)
                .zIndex(0)
            
            VStack( alignment: .center) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
                
                HStack {
                    Text(item.type.rawValue.uppercased()).font(.caption).foregroundColor(.orange).bold()
                    Spacer()
                }
                
                HStack{
                    Text(item.name).font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                    
                    Spacer()
                    
                    Text(String(format: "%.1f€", item.price)).font(.footnote).foregroundColor(.black)
                }
            }
            .padding()
            .zIndex(1)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {

    static var previews: some View {
        MenuItemCellView(item: FoodItem.example)
    }
}
