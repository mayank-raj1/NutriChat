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
            ChatWindowView().tabItem { Label("Chat", systemImage: "message.circle.fill")}
            
            
        }
    }
}



#Preview {
    MainView().environmentObject(ChatHandler())
}
