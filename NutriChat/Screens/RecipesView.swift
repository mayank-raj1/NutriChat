//
//  Recipes.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-24.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        @AppStorage("user") var userData: Data?
        @State var recipeBook: RecipeBook?
        let networkManager = NetworkManager()
        VStack{
            RecipeListVIew(recipes: MocDataGenerator.recipeBook.recipes)
        }.overlay(alignment: .bottomTrailing) {
            Button("Generate") {
                Task{
                    print("started")
                    let response =  await networkManager.getRecipes(userData!)
                    recipeBook?.recipes = try JSONDecoder().decode([Recipe].self, from: response)
                }
            }.buttonStyle(.borderedProminent).padding()
        }
    }
}

#Preview {
    RecipesView()
}
