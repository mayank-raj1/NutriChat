//
//  MocData.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-12.
//

import Foundation

struct UserPreferencesMockData {
    
    static func generateMockPreferences() -> UserPreferences {
        return UserPreferences(
            allergies: [.peanuts, .dairy],
            intolerances: [.gluten, .lactose],
            dietaryChoices: .omnivore,
            specificRestrictions: [.keto, .paleo],
            weightManagementGoal: .lose,
            healthConditions: [.diabetes, .highBloodPressure],
            nutrientPreferences: [.highProtein, .lowSodium],
            fitnessGoals: [.muscleBuilding, .endurance],
            cookingExperience: .intermediate,
            preferredCookingMethods: [.baking, .grilling],
            timeConstraints: .moderate,
            cuisinePreferences: [.italian, .mexican],
            flavourProfiles: [.spicy, .sweet],
            occasion: .weeknight,
            culturalCuisineOpenness: .balanced
        )
    }
}
