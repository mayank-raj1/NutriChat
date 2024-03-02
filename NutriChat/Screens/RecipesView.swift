//
//  Recipes.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-24.
//

import SwiftUI

struct RecipesView: View {
    @AppStorage("user") var userData: Data?
    @State var recipes: [Recipe] = []
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
            Button("Generate") {
                Task{
                    let response =  await networkManager.getRecipes(userData!)
                    self.recipes = try JSONDecoder().decode([Recipe].self, from: response)
                    print(try JSONDecoder().decode([Recipe].self, from: response))
                }
            }.buttonStyle(.borderedProminent).padding()
        }
    }
}

#Preview {
    RecipesView()
}

struct NetworkManager{
    private var url = URL(string: "http://127.0.0.1:5000/suggest")
    func getRecipes(_ userData: Data) async -> Data{
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = userData
        do {
            let (data, x) = try await URLSession.shared.data(for: request)
            print(data.base64EncodedString())
            print(x)
            return data
        } catch {
            print(error.localizedDescription)
            return Data(userData)
        }
    }
}
