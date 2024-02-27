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
    @FocusState private var sendFieldIsFocused: Bool
    
    var isProcessing: Bool {
        if chatHandler.messeges.count>0{
            return chatHandler.messeges[chatHandler.messeges.count - 1].isprocessing
        }
        return false
    }
    
    var body: some View {
        NavigationStack{
            HStack{
                TextField("Message", text: $textResponse, axis: .vertical)
                    .padding(10)
                    .background(.ultraThickMaterial)
                    .clipShape(.capsule)
                    .focused($sendFieldIsFocused)
                    .onSubmit() { submit }
                    .disabled(isProcessing)
                Button(action: {submit}, label: {
                    Image(systemName: isProcessing ? "square.circle.fill" : "arrow.up.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                }).disabled(isProcessing)
            }.toolbar(content: {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Exit"){
                        sendFieldIsFocused = false
                    }
                }
            })
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
