//
//  km.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-12.
//

import Foundation

struct UserPreferences {

    // Dietary Restrictions & Preferences
    let allergies: [Allergy] // Array of allergy strings
    let intolerances: [Intolerance] // Array of intolerance strings
    let dietaryChoices: DietaryChoice // Enum for vegetarian, vegan, etc.
    let specificRestrictions: [SpecificRestriction] // Array of specific restriction strings (keto, paleo, etc.)

    // Health & Wellness Goals
    let weightManagementGoal: WeightManagementGoal // Enum for gain, lose, maintain
    let healthConditions: [HealthCondition] // Array of health condition strings
    let nutrientPreferences: [NutrientPreference] // Array of preferred nutrient strings (high protein, low sodium, etc.)
    let fitnessGoals: [FitnessGoal]// Array of fitness goal strings (muscle building, athletic performance, etc.)

    // Cooking Habits & Skills
    let cookingExperience: CookingExperienceLevel // Enum for beginner, intermediate, advanced
    let preferredCookingMethods: [PreferredCookingMethod] // Array of preferred cooking method strings
    let timeConstraints: TimeConstraint // Enum for quick meals, elaborate dishes, etc.

    // Taste & Preferences
    let cuisinePreferences: [CuisinePreference] // Array of preferred cuisine strings
    let flavourProfiles: [FlavourProfile] // Array of preferred flavour profile strings (spicy, sweet, savory, etc.)
    let occasion: MealOccasion // Enum for weeknight meals, festive dishes, etc.
    let culturalCuisineOpenness: CulturalOpenness // Enum for exploring new or familiar cuisines

    // Nested Enums
    
    //Dietary Restrictions & Preferences
    
}

//protocol Prefrence: CaseIterable{
////    func allCasesArays: Array<Self> {
////        return Array(self.allCases)
////    }
//    
//    func getAllCasesString() -> [String]
//}
protocol Preference: RawRepresentable, CaseIterable, Hashable where RawValue == String {
    
}

extension Preference{
    static func getAllCasses() -> [Self]{
        return Array(Self.allCases)
    }
    }

enum DietaryChoice: String, Preference {
    case omnivore = "Omnivore"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case pescatarian = "Pescatarian"
    case glutenFree = "Gluten-free"
    case dairyFree = "Dairy-free"
    case nutFree = "Nut-free"
    case soyFree = "Soy-free"
    case eggFree = "Egg-free"
    case none = "None"
    case placeHolder = ""
}

enum Allergy: String, Preference {
    case shellfish = "Shellfish"
    case peanuts = "Peanuts"
    case treeNuts = "Tree nuts"
    case soy = "Soy"
    case dairy = "Dairy"
    case egg = "Egg"
    case wheat = "Wheat"
    case none = "None"
    case placeHolder = ""
}

enum Intolerance: String, Preference {
    case lactose = "Lactose"
    case gluten = "Gluten"
    case fructose = "Fructose"
    case histamine = "Histamine"
    case sulfites = "Sulfites"
    case none = "None"
    case placeHolder = ""
}

enum SpecificRestriction: String, Preference {
    case keto = "Keto"
    case paleo = "Paleo"
    case lowCarb = "Low-carb"
    case lowSodium = "Low-sodium"
    case highProtein = "High-protein"
    case none = "None"
    case placeHolder = ""
}

// Health & Wellness Goals
enum WeightManagementGoal: String, Preference {
    case gain = "Gain weight"
    case lose = "Lose weight"
    case maintain = "Maintain weight"
    case placeHolder = ""
}

enum HealthCondition: String, Preference {
    case diabetes = "Diabetes"
    case heartDisease = "Heart disease"
    case allergies = "Allergies"
    case celiacDisease = "Celiac disease"
    case highBloodPressure = "High blood pressure"
    case cholesterol = "High cholesterol"
    case other = "Other" // Add a text field for specifying other conditions (consult healthcare professionals for guidance)
    case none = "None"
    case placeHolder = ""
}

enum NutrientPreference: String, Preference {
    case highProtein = "High protein"
    case lowSodium = "Low sodium"
    case lowFat = "Low fat"
    case highFiber = "High fiber"
    case lowSugar = "Low sugar"
    case highIron = "High iron"
    case lowCarb = "Low carb"
    case other = "Other" // Add a text field for specifying other preferences
    case none = "None"
    case placeHolder = ""
}

enum FitnessGoal: String, Preference {
    case muscleBuilding = "Muscle building"
    case weightLoss = "Weight loss"
    case athleticPerformance = "Athletic performance"
    case generalFitness = "General fitness"
    case flexibility = "Improved flexibility"
    case endurance = "Increased endurance"
    case other = "Other" // Add a text field for specifying other goals
    case none = "None"
    case placeHolder = ""
}

//Cooking Habits & Skills
enum CookingExperienceLevel: String, Preference {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    case placeHolder = ""
}

enum PreferredCookingMethod: String, Preference {
    case baking = "Baking"
    case grilling = "Grilling"
    case sauteing = "Sauteing"
    case frying = "Frying"
    case roasting = "Roasting"
    case simmering = "Simmering"
    case boiling = "Boiling"
    case poaching = "Poaching"
    case steaming = "Steaming"
    case slowCooking = "Slow cooking"
    case onePot = "One-pot meals"
    case other = "Other" // Add a text field for specifying other methods
    case placeHolder = ""
}

enum TimeConstraint: String, Preference {
    case quick = "Quick meals (30 minutes or less)"
    case moderate = "Moderate time commitment (30-60 minutes)"
    case elaborate = "Elaborate dishes (over 60 minutes)"
    case placeHolder = ""
}

//
enum CuisinePreference: String, Preference {
    case italian = "Italian"
    case indian = "Indian"
    case mexican = "Mexican"
    case chinese = "Chinese"
    case thai = "Thai"
    case japanese = "Japanese"
    case korean = "Korean"
    case middleEastern = "Middle Eastern"
    case mediterranean = "Mediterranean"
    case american = "American"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case glutenFree = "Gluten-free"
    case other = "Other" // Add a text field for specifying other cuisines
    case placeHolder = ""
}

enum FlavourProfile: String, Preference {
    case spicy = "Spicy"
    case sweet = "Sweet"
    case savory = "Savory"
    case tangy = "Tangy"
    case creamy = "Creamy"
    case smoky = "Smoky"
    case umami = "Umami"
    case bitter = "Bitter"
    case sour = "Sour"
    case other = "Other" // Add a text field for specifying other preferences
    case placeHolder = ""
}

enum CulturalOpenness: String, Preference {
    case exploreNew = "Open to exploring new cuisines"
    case familiar = "Prefer familiar cuisines"
    case balanced = "Open to both new and familiar cuisines"
    case placeHolder = ""
}
enum MealOccasion: String, Preference {
    case weeknight = "Weeknight meals"
    case weekend = "Weekend meals"
    case festive = "Festive dishes"
    case placeHolder = ""
}
