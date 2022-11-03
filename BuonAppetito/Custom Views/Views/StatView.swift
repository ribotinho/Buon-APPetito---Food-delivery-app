//
//  StatView.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct StatView: View {
    
    var name: String
    var value: String
    var image: String
    var color: Color
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            Text(name)
                .foregroundColor(.secondary)
            
            HStack{
                Image(systemName: image).foregroundColor(color)
                Text(value)
                    .bold()
            }
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(name: "Ratings", value: "4.8", image: "star.fill", color: .yellow)
    }
}
