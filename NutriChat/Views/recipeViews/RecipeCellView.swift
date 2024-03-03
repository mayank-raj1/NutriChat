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
            Image("recipePage").resizable().aspectRatio(contentMode: .fit).frame(height: 60)
            VStack(alignment: .leading){
                Text(recipe.name).font(.title3).bold().frame(maxWidth: .infinity, alignment: .leading).lineLimit(2, reservesSpace: false)
                Text(recipe.category).font(.callout)
                HStack{
                    ForEach(recipe.tags, id: \.self){
                        Text($0).font(.caption2).padding(8).foregroundStyle(.primary).background(.thickMaterial).clipShape(.capsule)
                    }
                }
            }
        }.padding(10)
            .background(Color("topColor").gradient)

            .clipShape(.rect(cornerRadius: 10))
            
    }
}

#Preview {
    RecipeCellView(recipe: MocDataGenerator.recipe2)
}
