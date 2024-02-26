//
//  DietaryView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-12.
//

import SwiftUI

struct DietaryView: View, PreferenceSelectionScreenStruct {
    @EnvironmentObject var user: User
    
    var body: some View {
        Form{
            preferenceMultiSection(title: Allergy.getDescription(), options: Allergy.allCases, selectedOptions: user.preferences.allergies) { option in
                if (option == .none){
                    user.preferences.allergies.removeAll()
                    user.preferences.allergies.insert(option)
                }
                else if user.preferences.allergies.contains(option){
                    user.preferences.allergies.remove(option)
                } else{
                    user.preferences.allergies.remove(.none)
                    user.preferences.allergies.insert(option)
                }
            }
            
            preferenceMultiSection(title: Intolerance.getDescription(), options: Intolerance.allCases, selectedOptions: user.preferences.intolerances) { option in
                if (option == .none){
                    user.preferences.intolerances.removeAll()
                    user.preferences.intolerances.insert(option)
                }
                else if user.preferences.intolerances.contains(option){
                    user.preferences.intolerances.remove(option)
                } else{
                    user.preferences.intolerances.remove(.none)
                    user.preferences.intolerances.insert(option)
                }
            }
            
            preferenceMultiSection(title: DietaryChoice.getDescription(), options: DietaryChoice.allCases, selectedOptions: user.preferences.dietaryChoices) { option in
                if (option == .none){
                    user.preferences.dietaryChoices.removeAll()
                    user.preferences.dietaryChoices.insert(option)
                }
                else if user.preferences.dietaryChoices.contains(option){
                    user.preferences.dietaryChoices.remove(option)
                } else{
                    user.preferences.dietaryChoices.remove(.none)
                    user.preferences.dietaryChoices.insert(option)
                }
            }
            
            preferenceMultiSection(title: SpecificRestriction.getDescription(), options: SpecificRestriction.allCases, selectedOptions: user.preferences.specificRestrictions) { option in
                if (option == .none){
                    user.preferences.specificRestrictions.removeAll()
                    user.preferences.specificRestrictions.insert(option)
                }
                else if user.preferences.specificRestrictions.contains(option){
                    user.preferences.specificRestrictions.remove(option)
                } else{
                    user.preferences.specificRestrictions.remove(.none)
                    user.preferences.specificRestrictions.insert(option)
                }
            }
        }
    }
}

//var allergies: Set<Allergy> = []// Array of allergy strings
//var intolerances: Set<Intolerance> = [] // Array of intolerance strings
//var dietaryChoices: Set<DietaryChoice> = [] // Enum for vegetarian, vegan, etc.
//var specificRestrictions: Set<SpecificRestriction> = [] // Array of specific restriction strings (keto, paleo, etc.)

#Preview {
    DietaryView().environmentObject(MocDataGenerator.generateMocUser())
}
