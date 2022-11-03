//
//  OrderCompleteView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 3/11/22.
//

import SwiftUI

struct OrderCompleteView: View {
    
    var body: some View {
        
        VStack (alignment: .center){
            Image("slice")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:250, height: 250)
            
            Spacer()
            
            Text("Your order is complete!")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Spacer()
            
            
            OrderButton(text: "Back to menu")
        }
    }
    
}

struct OrderCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompleteView()
    }
}
