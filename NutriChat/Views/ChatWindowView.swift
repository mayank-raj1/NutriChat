//
//  ChatWindowView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct ChatWindowView: View {
    @EnvironmentObject var chatHandler: ChatHandler
    var body: some View {
        List {
            ForEach(chatHandler.messeges) { message in
                if message.participant == .user{
                    MessageSentView(message: message)
                }else{
                    MessageReceiveView(message: message)
                }
            }
        }.listStyle(.plain)
    }
}

