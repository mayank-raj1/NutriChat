//
//  PrefrenceView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct PreferencesView: View {
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            PrefrenceStartView().tag(0)
            DietaryView(userPreferences: .constant(UserPreferencesMockData.generateMockPreferences()))
                .tag(1)
            HealthWellnessView().tag(2)
            CookingHabitsView().tag(3)
        }
        HStack{
            if selectedTab>0{
                Button("Back") {
                    selectedTab-=1
                }
            }
            Spacer()
            Button(selectedTab<3 ? "Next":"Save") {
                if (selectedTab<3){
                    selectedTab += 1
                }else{
                    save()
                }
            }
        }.padding(.init(top: 10, leading: 40, bottom: 25, trailing: 40))
    }
    
    private func save() -> Void{
        return
    }
}

#Preview {
    PreferencesView()
}
