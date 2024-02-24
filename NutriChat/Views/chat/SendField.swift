//
//  SendField.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct SendField: View {
    @EnvironmentObject var chatHandler: ChatHandler
    @State var textResponse = ""
    @State var isProcessing = false
    
    var body: some View {
        HStack{
            TextField("Message", text: $textResponse, axis: .vertical)
                .padding(10)
                .background(.ultraThickMaterial)
                .clipShape(.capsule)
                .onSubmit() { submit }
                .disabled(isProcessing)
            Button(action: {submit}, label: {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                }).disabled(isProcessing)

        }
    }
    
    private var submit: Void {
        let messsage = textResponse
        textResponse = ""
        Task {
            await chatHandler.handle(message: messsage)
        }
    }
}

#Preview {
    SendField().environmentObject(ChatHandler())
}
