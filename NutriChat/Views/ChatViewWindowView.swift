//
//  ChatWindowView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct ChatViewWindowView: View {
    @EnvironmentObject var chatHandler: ChatHandler
    var body: some View {
        ZStack{
            ScrollView{
                ForEach(chatHandler.messeges) { message in
                    if message.participant == .user{
                        MessageSentView(message: message).padding(10)
                    }else{
                        MessageReceiveView(message: message).padding(10)
                    }
                }
                Spacer()
            }
        }.background {
            ZStack{
                Image("chatBg")
                Rectangle().foregroundColor(.cardBackground).opacity(0.5)
            }
        }
    }
}

#Preview {
    ChatViewWindowView().environmentObject(ChatHandler())
}
