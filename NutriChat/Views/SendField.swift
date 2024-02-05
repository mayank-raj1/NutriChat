//
//  SendField.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct SendField: View {
    @EnvironmentObject var chatHistory: ChatHistory
    @State var textResponse = ""
    
    private var submit: Void {
        chatHistory.addUserMessage(message: textResponse)
        textResponse = ""
        print("Nj")
    }
    
    var body: some View {
        HStack{
            TextField("Message", text: $textResponse, axis: .vertical)
                .padding(2)
                .textFieldStyle(.roundedBorder)
                .onSubmit() { submit }
            
            Button {
                submit
            } label: {
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
            }

        }
    }
}

#Preview {
    SendField().environmentObject(MocDate.chat)
}
