//
//  PrefrenceView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct PreferencesView: View {
    @AppStorage("user") private var userData: Data?
    
    @State var selectedTab = 0
    @StateObject var user: User = User(name: "John Doe")
    var body: some View {
        TabView(selection: $selectedTab) {
            PrefrenceStartView().tag(0)
            DietaryView()
                .tag(1)
            HealthWellnessView().tag(2)
            CookingHabitsView().tag(3)
        }.toolbar(content: {
            ToolbarItem(placement: .bottomBar, content: {
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
            })
        }).environmentObject(user)
    }
    
    private func save() -> Void{
        return
    }
}

#Preview {
    PreferencesView()
}
