//
//  Message.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI
import Foundation

struct Message: Hashable{
    let id  = UUID()
    var message: String
    var isUser: Bool
}

struct MocDate{
    static var message = Message(message: "Hey", isUser: true)
    static var messageRecive = Message(message: "How are you?", isUser: false)
}
