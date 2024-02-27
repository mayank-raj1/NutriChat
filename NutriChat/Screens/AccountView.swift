//
//  AccountView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-23.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("user") private var userData: Data?
    
    @State private var alertItem: AlertItem?
    @StateObject var user: User = User()
    @State var isSelecting: Bool = false
    var body: some View {
        Form{
            Section("Details") {
                TextField("Fist Name", text: $user.firstName)
                TextField("Last Name", text: $user.lastName)
                Picker("Age", selection: $user.age) {
                    ForEach(0..<100){
                        Text("\($0+1)")
                    }
                }
                Picker("Sex", selection: $user.sex){
                    ForEach(user.sexes, id: \.self){
                        Text($0)
                    }
                }
                Button("Save Details") {
                    saveData()
                }
            }
            Section("Preferences") {
                Button("Change Preferences") {
                    isSelecting = true
                }
            }
        }.sheet(isPresented: $isSelecting, content: {
            PreferencesSelectionView(isSelecting: $isSelecting)
        }).onAppear {
            loadData()
        }
    }
    
    private func loadData() -> Void{
        guard let userData = self.userData else{
            print("nja")
            return
        }
        do{
            print(String(data: userData, encoding: .utf8)!)
            user.replace(with: try JSONDecoder().decode(User.self, from: userData))
        }catch{
            
        }
    }
    
    private func saveData() -> Void{
        do {
            userData = try JSONEncoder().encode(user)
        }catch{
            //
        }
    }
}

#Preview {
    AccountView()
}
