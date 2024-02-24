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
    @StateObject var user: User = User(name: "John Doe")
    @State var isSelecting: Bool = false
    var body: some View {
        Form{
            Section("Preferences") {
                Button("Change Preferences") {
                    isSelecting = true
                }
            }
        }.sheet(isPresented: $isSelecting, content: {
            PreferencesSelectionView(isSelecting: $isSelecting)
        }).onAppear()
    }
    
    private func loadData() -> Void{
        do{
            
        }
    }
}

#Preview {
    AccountView()
}
