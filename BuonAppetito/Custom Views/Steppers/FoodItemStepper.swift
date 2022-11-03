//
//  QuantityStepper.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct FoodItemStepper: View {
    
    @Binding var item : Food
    
    var body: some View {
        ZStack {
            
            Capsule()
                .fill(Color(UIColor.secondarySystemBackground.cgColor))
                .frame(width:125, height: 50)
            
            HStack{
                ZStack{
                    Circle()
                        .fill(.white)
                        .frame(width:30, height: 30)
                        
                    Image(systemName: "minus")
                        .foregroundColor(.gray)
                        
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    item.decrement()
                }
                
                
                Text("\(item.quantity)")
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 5)
                
                ZStack{
                    Circle()
                        .fill(.white)
                        .frame(width:30, height: 30)
                    
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    item.increment()
                }
            }
        }
    }
}

struct QuantityStepper_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemStepper(item: .constant(Food.example))
    }
}
