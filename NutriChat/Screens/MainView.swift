//
//  MainView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundStyle(.black)
            TabView{
                Group{
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
                    }.background().tabItem { Label("Account", systemImage: "person.crop.circle") }
                }.toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Color.creamBackground, for: .tabBar)
            }
        }
    }
}



#Preview {
    MainView().environmentObject(ChatHandler())
}
