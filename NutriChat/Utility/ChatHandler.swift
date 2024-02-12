//
//  Chat.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-10.
//

import Foundation
import GoogleGenerativeAI

final class ChatHandler: ObservableObject{
    @Published var messeges: [Message]
    
    private let model: GenerativeModel
    private let chat: Chat
    
    init() {
        self.model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
        self.chat = model.startChat()
        self.messeges = []
    }
    
    func handle(message: String) async -> Void{
        print(message)
        addUserMessage(message: message)
        do{
            let response = try await chat.sendMessage(message)
            addSystemMessage(message: response.text ?? "Its Tripy")
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    
//    private var upadateMesseges:Void {
//        history.forEach { item in
//            
//        }
//        return
//    }
    
    func addUserMessage(message: String){
        let user = Message(message: message, participant: .user)
        messeges.append(user)
    }
    
    func addSystemMessage(message: String){
        let system = Message(message: message, participant: .system)
        messeges.append(system)
    }
}

struct Mock{
    static  let history = [
        ModelContent(role: "user", parts: "Hello! You're an AI conversational model designed to engage with users in a friendly and helpful manner. Your purpose is to provide assistance, information, and engaging conversation on a wide range of topics. Be welcoming and attentive to users' needs, and strive to create a positive and enjoyable interaction experience. Remember to be polite, respectful, and responsive in your interactions. Let's create meaningful conversations and provide valuable assistance to our users!"),
        ModelContent(role: "system", parts: "Hello! Thank you for the clear instructions. I'm here and ready to assist users with any questions they have, provide information on various topics, and engage in friendly conversation. I'll make sure to be welcoming, attentive, and respectful in all interactions. Let's create some meaningful conversations together and provide valuable assistance to our users!"),
      ]
}
