//
//  ChatWindowView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct ChatWindowView: View {
    @EnvironmentObject var chatHistory: ChatHistory
    var body: some View {
        List {
            ForEach(chatHistory.messages) { message in
                if message.isUser{
                    MessageSentView(message: message)
                }else{
                    MessageReceiveView(message: message)
                }
            }
        }.listStyle(.plain)
    }
}

#Preview {
    ChatWindowView().environmentObject(MocDate.chat)
}
