//
//  Messges.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct MessageSentView: View {
    var message: Message
    var body: some View {
            Text(message.message)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.white)
                .padding(12)
                .background(Color(UIColor.systemBlue))
                .clipShape(.rect(cornerRadius: 15))
    }
        
}

#Preview {
    MessageSentView(message: MocDate.message)
}
