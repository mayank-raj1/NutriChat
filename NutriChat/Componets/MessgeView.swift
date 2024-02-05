//
//  Messges.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct Messges: View {
    var message: Message
    var body: some View {
        VStack{
            Text(message.message)
                .multilineTextAlignment(.leading)
                .foregroundStyle(message.isUser ? Color.white : .primary)
                .padding()
                .background(Color(message.isUser ? UIColor.systemBlue : UIColor.systemGray5))
                .clipShape(.capsule)
                
        }
        
    }
}
