//
//  PlacerOrderButton.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 3/11/22.
//

import SwiftUI

struct PlacerOrderButton: View {
    @ObservedObject var viewModel : StoreViewModel
    
    var body: some View {
        Button {
            //check out
        } label: {
            ZStack{
                Capsule()
                    .fill(.orange)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.horizontal)
                
                Text("Check out")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct PlacerOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        PlacerOrderButton(viewModel: StoreViewModel())
    }
}
