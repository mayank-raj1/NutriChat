//
//  DietaryView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-12.
//

import SwiftUI

struct DietaryView: View {
    @Binding var userPreferences: UserPreferences
    var body: some View {
        Form{
            
        }
        
    }
}

#Preview {
    DietaryView(userPreferences: .constant(UserPreferencesMockData.generateMockPreferences()))
}
