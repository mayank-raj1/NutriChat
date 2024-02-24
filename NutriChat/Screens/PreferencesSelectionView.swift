//
//  PrefrenceView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct PreferencesSelectionView: View {
    @AppStorage("user") private var userData: Data?
    @State var selectedTab = 0
    var user: User = User(name: "")
    @Binding var isSelecting: Bool
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab,
                    content:  {
                PrefrenceStartView().tag(0)
                DietaryView().tag(1)
                HealthWellnessView().tag(2)
                CookingHabitsView().tag(3)
            }).tabViewStyle(.page)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        isSelecting = false
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        save()
                    }
                }
                ToolbarItemGroup(placement: .bottomBar, content: {
                    if selectedTab>0{
                        Button("Back") {
                            selectedTab-=1
                        }
                    }
                    Spacer()
                    if selectedTab<3{
                        Button("Next") {
                            selectedTab += 1
                        }
                    }
                })
            }).environmentObject(user)
                .onAppear(perform: {
                    guard let userData = self.userData else{
                        return
                    }
                    do{
                        //user = try JSONDecoder().decode(User.self, from: userData)
                    }
                    catch{
                        //
                    }
                })
        }
    }
    
    private func save() -> Void{
        
        isSelecting = false
    }
}

//#Preview {
//    PreferencesSelectionView()
//}
