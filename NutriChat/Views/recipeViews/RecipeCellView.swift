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
        VStack(alignment: .leading){
            Text(recipe.name).font(.title3).bold().frame(maxWidth: .infinity, alignment: .leading).lineLimit(2, reservesSpace: false)
            Text(recipe.category).font(.callout)
            HStack{
                ForEach(recipe.tags, id: \.self){
                    Text($0).font(.caption2).padding(8).foregroundStyle(.primary).background(.thickMaterial).clipShape(.capsule)
                }
            }
        }.padding(10)
            .background(.linearGradient(colors: [Color("topColor"), Color("bottomColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(.rect(cornerRadius: 10))
            //.border(Rectangle(), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RecipeCellView(recipe: MocDataGenerator.recipe2)
}
