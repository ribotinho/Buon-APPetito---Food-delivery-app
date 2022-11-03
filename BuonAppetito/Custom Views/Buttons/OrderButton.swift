//
//  PlacerOrderButton.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 3/11/22.
//

import SwiftUI

struct OrderButton: View {
    
    var text : String
    
    var body: some View {
        ZStack{
            Capsule()
                .fill(.orange)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.horizontal)
            
            Text(text)
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct PlacerOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(text: "Placer order")
    }
}
