//
//  RecipeDetailedView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-27.
//

import SwiftUI

struct RecipeDetailedView: View {
    var recipe: Recipe
    @Binding var isShowingDetailedRecipe: Bool
    var body: some View {
        NavigationStack{
            
            ScrollView{
                VStack{
                    Text(recipe.name).font(.title).fontWeight(.semibold).padding(.bottom, 30)
                    Label(recipe.category, systemImage: "fork.knife.circle").padding(.bottom)
                    Image("RecipeBook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                    HStack{
                        ForEach(recipe.tags, id: \.self){
                            Text($0).font(.caption2).fontWeight(.semibold)
                                .padding(8).foregroundStyle(.primary).background(.thickMaterial)
                                .clipShape(.capsule)
                        }
                    }
                    
                    GroupBox(label:
                                Label("Ingredients", systemImage: "basket.fill")
                        .font(.headline)) {
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text to leading
                                .padding(.vertical, 4)
                        }
                    }
                    
                    GroupBox(label: Label("Steps", systemImage: "list.bullet.clipboard.fill").font(.headline)) {
                        ForEach(recipe.steps, id: \.self) { step in
                            Text(step)
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text to leading
                                .padding(.vertical, 4)
                        }
                    }
                }
            }.toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        isShowingDetailedRecipe = false
                    }.foregroundStyle(.primary)
                }
            })
        }
    }
}

#Preview {
    RecipeDetailedView(recipe: MocDataGenerator.recipe2, isShowingDetailedRecipe: .constant(true))
}
