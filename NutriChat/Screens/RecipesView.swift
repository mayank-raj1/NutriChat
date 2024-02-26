//
//  Recipes.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-24.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        VStack{
            RecipeListVIew(recipeBook: MocDataGenerator.recipeBook)
        }
    }
}

#Preview {
    RecipesView()
}
