//
//  RecipeListVIew.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-26.
//

import SwiftUI

struct RecipeListVIew: View {
    var recipes: [Recipe]
    @State var isShowingDetailedRecipe: Bool = false
    @State var detailedRecipe: Recipe = MocDataGenerator.recipe1
    var body: some View {
        ScrollView{
            VStack{
                ForEach(recipes, id: \.self) { recipe in
                    RecipeCellView(recipe: recipe).onTapGesture(perform: {
                        detailedRecipe = recipe
                        isShowingDetailedRecipe = true
                    }).padding(.bottom, 5)
                }
            }.padding().sheet(isPresented: $isShowingDetailedRecipe, content: {
                RecipeDetailedView(recipe: detailedRecipe, isShowingDetailedRecipe: $isShowingDetailedRecipe)
            })
        }
    }
}

#Preview {
    RecipeListVIew(recipes: MocDataGenerator.recipes)
}
