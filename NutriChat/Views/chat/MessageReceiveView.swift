//
//  MessageReceiveView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct MessageReceiveView: View {
    var message: Message
    @State private var isVisible = false
    
    var body: some View {
        HStack(alignment: .bottom){
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundStyle(.teal)
                .background(.primary)
                .clipShape(Circle())
                
            if message.isprocessing{
                BouncingDots().padding().background(Color(UIColor.systemGray5)).clipShape(.rect(cornerRadius: 15))
            }else {
                Text(.init(message.message))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.primary)
                    .padding(12)
                    .background(Color(UIColor.systemGray5))
                    .clipShape(.rect(cornerRadius: 15))
            }
            Spacer()
        }.padding(.trailing)
            .opacity(isVisible || !message.isprocessing ? 1 : 0)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { timer in
                                withAnimation {
                                    self.isVisible = true
                                }
                            }
                        }
    }
}

#Preview {
    MessageReceiveView(message: MocDate.message)
}

