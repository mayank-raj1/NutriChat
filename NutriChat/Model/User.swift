//
//  User.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-16.
//

import Foundation
import SwiftUI

final class User: ObservableObject, Identifiable{
    var id: UUID
    var name: String
    @Published var preferences = [
        [DietaryChoice.placeHolder],
        [Allergy.placeHolder],
        [Intolerance.placeHolder],
        [SpecificRestriction.placeHolder],

        [WeightManagementGoal.placeHolder],
        [HealthCondition.placeHolder],
        [NutrientPreference.placeHolder],
        [FitnessGoal.placeHolder],
        
        [CookingExperienceLevel.placeHolder],
        [PreferredCookingMethod.placeHolder],
        [TimeConstraint.placeHolder],
        [CuisinePreference.placeHolder],
        [CulturalOpenness.placeHolder],
        [MealOccasion.placeHolder]
    ]
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
