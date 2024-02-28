//
//  PrefrenceView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct PreferencesSelectionView: View {
    // User Model Data
    @AppStorage("user") private var userData: Data?
    @StateObject var user: User = User()
    
    // View
    @State var selectedTab = 0
    @Binding var isSelecting: Bool
    @State private var alertItem: AlertItem?
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab,
                    content:  {
                PrefrenceStartView(pageNumber: $selectedTab).tag(0)
                DietaryView().tag(1)
                HealthWellnessView().tag(2)
                CookingHabitsView().tag(3)
            }).tabViewStyle(.page(indexDisplayMode: .never))
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
                        Button("Back") { selectedTab-=1 }
                    }
                    Spacer()
                    if selectedTab<3 && selectedTab>0{
                        Button("Next") {
                            selectedTab += 1}
                    }
                })
            })
            .alert(alertItem?.title ?? "", isPresented: $isShowingAlert, actions: {
                Button(alertItem?.dismissbutton ?? "", action: {isShowingAlert = false})
                       }, message: {
                           Text(alertItem?.message ?? "")
                })
            .environmentObject(user)
            .onAppear(perform: {loadData()})
        }
    }
    
    func save() -> Void {
        do{
            userData = try JSONEncoder().encode(user)
            alertItem = AlertContext.preferenceSaved
            isShowingAlert = true
        }catch{
            alertItem = AlertContext.preferenceNotSaved
            isShowingAlert = true
        }
    }
    
    func loadData() -> Void{
        guard let userData = self.userData else{
            alertItem = AlertContext.dataNotLoaded
            isShowingAlert = true
            return
        }
        do{
            let storageUser = try JSONDecoder().decode(User.self, from: userData)
            user.id = storageUser.id
            user.firstName = storageUser.firstName
            user.lastName = storageUser.lastName
            user.preferences = storageUser.preferences
        }
        catch{
            alertItem = AlertContext.dataNotLoaded
            isShowingAlert = true
        }
    }
}

#Preview {
    PreferencesSelectionView(isSelecting: .constant(true))
}
