//
//  RecipeTitleView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-27.
//

import SwiftUI

struct RecipeTitleView: View {
    var recipe: Recipe
    var body: some View {
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
                        .padding(8).foregroundStyle(.primary).background(.thickMaterial).clipShape(.capsule)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.linearGradient(colors: [Color("topColor"), Color("bottomColor")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    RecipeTitleView(recipe: MocDataGenerator.recipe1)
}
