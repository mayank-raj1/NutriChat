//
//  AccountView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-23.
//

import SwiftUI

struct AccountView: View {
    //User Data
    @AppStorage("user") private var userData: Data?
    @StateObject var user: User = User()
    
    //View
    @State var isSelecting: Bool = false
    @State private var alertItem: AlertItem?
    @State private var isShowingAlert: Bool = false
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
        }.background(.windowBackground)
        .sheet(isPresented: $isSelecting, content: {
            PreferencesSelectionView(isSelecting: $isSelecting)
        })
        .alert(alertItem?.title ?? "", isPresented: $isShowingAlert, actions: {
            Button(alertItem?.dismissbutton ?? "", action: {isShowingAlert = false})
                   }, message: {
                       Text(alertItem?.message ?? "")
            })
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() -> Void{
        guard let userData = self.userData else{
            alertItem = AlertContext.dataNotLoaded
            isShowingAlert = true
            return
        }
        do{
            user.replace(with: try JSONDecoder().decode(User.self, from: userData))
        }catch{
            alertItem = AlertContext.dataNotLoaded
            isShowingAlert = true
        }
    }
    
    private func saveData() -> Void{
        do {
            userData = try JSONEncoder().encode(user)
            alertItem = AlertContext.detailsSaved
            isShowingAlert = true
        }catch{
            alertItem = AlertContext.detailsNotSaved
            isShowingAlert = true
        }
    }
}

#Preview {
    AccountView()
}
