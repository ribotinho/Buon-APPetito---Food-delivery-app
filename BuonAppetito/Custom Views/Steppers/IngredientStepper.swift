//
//  IngredientStepper.swift
//  BuonAppetito
//
//  Created by Pau Ribot Pujolras on 2/11/22.
//

import SwiftUI

struct IngredientStepper: View {
    @Binding var item : Food
    @Binding var ingredient : Ingredient
    
    var body: some View {
        
    }
}


struct IngredientStepper_Previews: PreviewProvider {
    static var previews: some View {
        IngredientStepper(item: .constant(Food.example), ingredient: .constant(Ingredient.example))
    }
}
