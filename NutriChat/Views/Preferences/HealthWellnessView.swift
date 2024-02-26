//
//  jac.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct HealthWellnessView: View, PreferenceSelectionScreenStruct {
    @EnvironmentObject var user: User
    
    var body: some View {
        Form{
            preferenceSingleSection(title: WeightManagementGoal.getDescription(), options: WeightManagementGoal.allCases, selectedOptions: user.preferences.weightManagementGoal) { option in
                    user.preferences.weightManagementGoal = option
            }
            
            preferenceMultiSection(title: HealthCondition.getDescription(), options: HealthCondition.allCases, selectedOptions: user.preferences.healthConditions) { option in
                if (option == .none){
                    user.preferences.healthConditions.removeAll()
                    user.preferences.healthConditions.insert(option)
                }
                else if user.preferences.healthConditions.contains(option){
                    user.preferences.healthConditions.remove(option)
                } else{
                    user.preferences.healthConditions.remove(.none)
                    user.preferences.healthConditions.insert(option)
                }
            }
            
            preferenceMultiSection(title: NutrientPreference.getDescription(), options: NutrientPreference.allCases, selectedOptions: user.preferences.nutrientPreferences) { option in
                if (option == .none){
                    user.preferences.nutrientPreferences.removeAll()
                    user.preferences.nutrientPreferences.insert(option)
                }
                else if user.preferences.nutrientPreferences.contains(option){
                    user.preferences.nutrientPreferences.remove(option)
                } else{
                    user.preferences.nutrientPreferences.remove(.none)
                    user.preferences.nutrientPreferences.insert(option)
                }
            }
            
            preferenceMultiSection(title: FitnessGoal.getDescription(), options: FitnessGoal.allCases, selectedOptions: user.preferences.fitnessGoals) { option in
                if (option == .none){
                    user.preferences.fitnessGoals.removeAll()
                    user.preferences.fitnessGoals.insert(option)
                }
                else if user.preferences.fitnessGoals.contains(option){
                    user.preferences.fitnessGoals.remove(option)
                } else{
                    user.preferences.fitnessGoals.remove(.none)
                    user.preferences.fitnessGoals.insert(option)
                }
            }
        }
    }
}

#Preview {
    HealthWellnessView().environmentObject(MocDataGenerator.generateMocUser())
}
