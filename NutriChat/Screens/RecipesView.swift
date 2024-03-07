//
//  Recipes.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-24.
//

import SwiftUI

struct RecipesView: View {
    // Data Management
    @AppStorage("user") var userData: Data?
    @State var recipes: [Recipe] = []
    @State var generating: Bool = false
    // Alerts
    @State private var alertItem: AlertItem?
    @State private var isShowingAlert: Bool = false
    
    let networkManager = NetworkManager()
    var body: some View {
        ZStack{
            RecipeListVIew(recipes: recipes)
            if generating {
                ZStack{
                    Rectangle().foregroundStyle(.background)
                    VStack{
                        Image("processing").resizable().scaledToFit().frame(width: 300)
                        ProgressView().tint(.bright).dynamicTypeSize(.accessibility5)
                        Text("We are generating personized recipes just for you, it might take a moment.").multilineTextAlignment(.center)
                            .font(.title2).padding()
                    }
                }
            }
            else if recipes.count==0{
                EmptyState()
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                Task{
                    generating = true
                    do{
                        let response =  try await networkManager.getRecipes(userData!)
                        self.recipes = try JSONDecoder().decode([Recipe].self, from: response)
                    } catch {
                        alertItem = AlertContext.networkError
                        isShowingAlert = true
                    }
                    generating = false
                }
            } label: {
                Label("Generate", systemImage: "wand.and.stars").dynamicTypeSize(.xLarge).bold()
                    .foregroundStyle(.hard)
                    .padding().background(.bright).clipShape(.buttonBorder)
            }.padding()
        }
        .alert(alertItem?.title ?? "", isPresented: $isShowingAlert, actions: {
            Button(alertItem?.dismissbutton ?? "", action: {isShowingAlert = false})
                   }, message: {
                       Text(alertItem?.message ?? "")
            })
    }
}

#Preview {
    RecipesView()
}

struct EmptyState: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundStyle(.background)
            VStack{
                Image("Empty").resizable().scaledToFit().frame(width: 300)
                Text("Hit Generate to see recipes!").font(.title2).padding()
            }
        }
    }
}
