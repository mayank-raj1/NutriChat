//
//  asf.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct CookingHabitsView: View, PreferenceSelectionScreenStruct {
    @EnvironmentObject var user: User
    
    var body: some View {
        Form{
            preferenceSingleSection(title: CookingExperienceLevel.getDescription(), options: CookingExperienceLevel.allCases, selectedOptions: user.preferences.cookingExperience) { option in
                    user.preferences.cookingExperience = option
            }
            
            preferenceMultiSection(title: PreferredCookingMethod.getDescription(), options: PreferredCookingMethod.allCases, selectedOptions: user.preferences.preferredCookingMethods) { option in
                 if user.preferences.preferredCookingMethods.contains(option){
                    user.preferences.preferredCookingMethods.remove(option)
                } else{
                    user.preferences.preferredCookingMethods.insert(option)
                }
            }
            
            preferenceSingleSection(title: TimeConstraint.getDescription(), options: TimeConstraint.allCases, selectedOptions: user.preferences.timeConstraints) { option in
                    user.preferences.timeConstraints = option
            }
            
            preferenceMultiSection(title: CuisinePreference.getDescription(), options: CuisinePreference.allCases, selectedOptions: user.preferences.cuisinePreferences) { option in
                if user.preferences.cuisinePreferences.contains(option){
                    user.preferences.cuisinePreferences.remove(option)
                } else{
                    user.preferences.cuisinePreferences.insert(option)
                }
            }
            
            preferenceMultiSection(title: FlavourProfile.getDescription(), options: FlavourProfile.allCases, selectedOptions: user.preferences.flavourProfiles) { option in
                if user.preferences.flavourProfiles.contains(option){
                    user.preferences.flavourProfiles.remove(option)
                } else{
                    user.preferences.flavourProfiles.insert(option)
                }
            }
            
            preferenceSingleSection(title: MealOccasion.getDescription(), options: MealOccasion.allCases, selectedOptions: user.preferences.occasion) { option in
                    user.preferences.occasion = option
            }
            
            preferenceSingleSection(title: CulturalOpenness.getDescription(), options: CulturalOpenness.allCases, selectedOptions: user.preferences.culturalCuisineOpenness) { option in
                    user.preferences.culturalCuisineOpenness = option
            }
        }
    }
}

#Preview {
    CookingHabitsView().environmentObject(UserPreferencesMockData.generateMocUser())
}
//// Habits & Skills



//// & Preferences

//var culturalCuisineOpenness: CulturalOpenness = CulturalOpenness.placeHolder // Enum for exploring new or familiar cuisines
