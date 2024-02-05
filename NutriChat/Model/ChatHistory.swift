//
//  ChatHistory.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import Foundation

final class ChatHistory: Identifiable, ObservableObject{
    var id = UUID()
    @Published var messages: [Message]
    
    init(messages: [Message]) {
        self.messages = messages
    }
    
    func addUserMessage(message: String){
        messages.append(Message(message: message, isUser: true))
    }
    
    func addMessage(message: String){
        messages.append(Message(message: message, isUser: false))
    }
}
