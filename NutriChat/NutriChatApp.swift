//
//  NutriChatApp.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

@main
struct NutriChatApp: App {
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(ChatHandler())
        }
    }
}
