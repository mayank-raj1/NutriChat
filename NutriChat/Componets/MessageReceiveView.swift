//
//  MessageReceiveView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct MessageReceiveView: View {
    var message: Message
    var body: some View {
        HStack(alignment: .bottom){
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundStyle(.teal)
                
            Text(message.message)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.primary)
                .padding(12)
                .background(Color(UIColor.systemGray5))
                .clipShape(.rect(cornerRadius: 15))
            Spacer()
        }.padding(.trailing)
    }
}

#Preview {
    MessageReceiveView(message: MocDate.messageRecive)
}

