//
//  RecipeListVIew.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-26.
//

import SwiftUI

struct RecipeListVIew: View {
    var recipeBook: RecipeBook
    var body: some View {
        VStack{
            List(recipeBook.recipes) { recipe in
                RecipeCellView(recipe: recipe)
            }
        }
    }
}

#Preview {
    RecipeListVIew(recipeBook: MocDataGenerator.recipeBook)
}
