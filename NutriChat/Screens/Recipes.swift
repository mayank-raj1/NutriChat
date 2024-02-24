//
//  Recipes.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-24.
//

import SwiftUI

struct Recipes: View {
    var body: some View {
        VStack{
            Text("Recipes")
            Image("recipes_tab").resizable().scaledToFit()
                .frame(width: 40)
        }
    }
}

#Preview {
    Recipes()
}
