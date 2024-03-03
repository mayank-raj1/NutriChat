//
//  MainView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            NavigationStack{
                RecipesView().navigationTitle("Recipes 📖").toolbarTitleDisplayMode(.inlineLarge)
            }.tabItem { Label("Recipes", systemImage: "book.pages")
            }
            NavigationStack{
                ChatWindowView().navigationTitle("Chat 💬").toolbarTitleDisplayMode(.inlineLarge).toolbarBackground(.visible, for: .navigationBar)
            }.tabItem {
                Label("Chat", systemImage: "message")
            }
            NavigationStack{
                AccountView().navigationTitle("Account 😎").toolbarTitleDisplayMode(.inlineLarge)
            }.tabItem { Label("Account", systemImage: "person.crop.circle") }
        }.tint(.green)
    }
}



#Preview {
    MainView().environmentObject(ChatHandler())
}
