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
            Recipes().tabItem { Label("Recipes", systemImage: "book.pages")
            }
            ChatWindowView().tabItem {
                Label("Chat", systemImage: "message")
            }
            AccountView().tabItem { Label("Account", systemImage: "person.crop.circle") }
        }.tint(.green)
    }
}



#Preview {
    MainView().environmentObject(ChatHandler())
}
