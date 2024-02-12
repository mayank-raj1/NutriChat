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
        addSystemMessage()
        do{
            let response = try await chat.sendMessage(message)
            messeges[messeges.count-1].message = response.text ?? "Oppise daisy"
            messeges[messeges.count-1].isprocessing = false
            //addSystemMessage(message: response.text ?? "Its Tripy")
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func addUserMessage(message: String){
        let user = Message(message: message, participant: .user)
        messeges.append(user)
    }
    
    func addSystemMessage(){
        let system = Message(message: "", participant: .system, isprocessing: true)
        messeges.append(system)
    }
}
