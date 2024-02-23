//
//  AccountView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-23.
//

import SwiftUI

struct AccountView: View {
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
        })
    }
}

#Preview {
    AccountView()
}
