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
    @State var isProcessing = false
    
    private var submit: Void {
        chatHistory.addUserMessage(message: textResponse)
        textResponse = ""
        print("Stating")
        Task.init {
            await delay()
        }
        print("Ended")
    }
    
    private func delay() async -> Void {
        isProcessing = true
        print("1")
        do{
            try await Task.sleep(for: .seconds(5))
        }
        catch{
            //
        }
        isProcessing = false
        print("2")
        return
    }
    
    var body: some View {
        HStack{
            TextField("Message", text: $textResponse, axis: .vertical)
                .padding(2)
                .textFieldStyle(.roundedBorder)
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
}

#Preview {
    SendField().environmentObject(MocDate.chat)
}
