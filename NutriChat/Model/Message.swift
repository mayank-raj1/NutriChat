//
//  Message.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI
import Foundation

enum Participant {
  case system
  case user
}


struct Message: Hashable, Identifiable{
    let id  = UUID()
    var message: String
    var participant: Participant
}

struct MocDate{
    static var message = Message(message: "Hey", participant: .user)
    static var messageRecive = Message(message: "How are you?", participant: .system)
    
    static var chat = ChatHistory(messages: [message, messageRecive, message, messageRecive])
    
}
