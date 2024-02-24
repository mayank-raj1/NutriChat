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
                        MessageSentView(message: message)
                    }else{
                        MessageReceiveView(message: message)
                    }
                }
                Spacer()
            }
        }.background {
            Image("chatBg").brightness(-0.13)
        }
    }
}

#Preview {
    ChatViewWindowView().environmentObject(ChatHandler())
}
