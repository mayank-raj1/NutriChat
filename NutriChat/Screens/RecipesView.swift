//
//  Recipes.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-24.
//

import SwiftUI

struct RecipesView: View {
    @AppStorage("user") var userData: Data?
    @State var recipes: [Recipe] = MocDataGenerator.recipes
    let networkManager = NetworkManager()
    var body: some View {
        ZStack{
            RecipeListVIew(recipes: recipes)
            if recipes.count==0{
                ZStack{
                    Rectangle().foregroundStyle(.background)
                    Text("Refresh to see recipes!")
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                Task{
                    let response =  await networkManager.getRecipes(userData!)
                    self.recipes = try JSONDecoder().decode([Recipe].self, from: response)
                    print(try JSONDecoder().decode([Recipe].self, from: response))
                }
            }, label: {
                Image(systemName: "wand.and.stars").resizable().scaledToFit().frame(width: 60)
                    .symbolRenderingMode(.palette).foregroundStyle(.background, .yellow).padding(10)
            })  .buttonBorderShape(.circle).buttonStyle(.borderedProminent).padding()
        }
    }
}

#Preview {
    RecipesView()
}
