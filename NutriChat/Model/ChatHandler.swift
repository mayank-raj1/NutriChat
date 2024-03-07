//
//  Chat.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-10.
//

import Foundation
import GoogleGenerativeAI
import SwiftUI

final class ChatHandler: ObservableObject{
    @Published var messeges: [Message]
    @AppStorage("user") var userData: Data?
    private let model: GenerativeModel
    private let chat: Chat
    
    init() {
        self.model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
        self.chat = model.startChat()
        self.messeges = []
        initialSetup()
    }
    
    func initialSetup(){
        let prompt = MocDataGenerator.chatPrompt + (String(data: userData! , encoding: .utf8) ?? "")
        addSystemMessage()
        Task{
            do{
                let response = try await chat.sendMessage(prompt)
                messeges[messeges.count-1].message = response.text ?? "An error ooucred"
                messeges[messeges.count-1].isprocessing = false
            }catch{
                messeges[messeges.count-1].message = "An error ooucred"
                messeges[messeges.count-1].isprocessing = false
            }
        }
    }
    
    func handle(message: String) async -> Void{
        addUserMessage(message: message)
        addSystemMessage()
        do{
            let response = try await chat.sendMessage(message)
            messeges[messeges.count-1].message = response.text ?? "An error ooucred"
            messeges[messeges.count-1].isprocessing = false
        }
        catch{
            messeges[messeges.count-1].message = "An error ooucred"
            messeges[messeges.count-1].isprocessing = false
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
