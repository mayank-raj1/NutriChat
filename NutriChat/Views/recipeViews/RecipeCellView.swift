//
//  RecipeCell View.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-26.
//

import SwiftUI

struct RecipeCellView: View {
    var recipe: Recipe
    var body: some View {
        HStack(alignment: .top){
            Image("recipePage").resizable().aspectRatio(contentMode: .fit)
                .frame(height: 60).foregroundStyle(.hard)
            VStack(alignment: .leading){
                Text(recipe.name).font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2, reservesSpace: false).foregroundStyle(.hard)
                Text(recipe.category).font(.callout)
                HStack{
                    ForEach(recipe.tags, id: \.self){
                        Text($0).font(.caption2).padding(8)
                            .foregroundStyle(.primary)
                            .background(.thinMaterial)
                            .clipShape(.capsule)
                    }
                }
            }
        }.padding(10)
            .background(.cardBackground.gradient)
            .clipShape(.rect(cornerRadius: 20, style: .continuous))
            
    }
}

#Preview {
    RecipeCellView(recipe: MocDataGenerator.recipe2)
}
