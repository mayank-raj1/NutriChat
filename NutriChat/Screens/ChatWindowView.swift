//
//  ChatWindowView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-21.
//

import SwiftUI

struct ChatWindowView: View {
    var body: some View {
        NavigationStack{
            VStack{
                ChatViewWindowView()
                Divider().frame(height: 12)
                SendField().padding().background(.background).tint(.bright)
            }
        }
    }
}

#Preview {
    ChatWindowView().environmentObject(ChatHandler())
}

