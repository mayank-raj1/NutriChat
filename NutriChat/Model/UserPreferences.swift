//
//  km.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-12.
//

import Foundation

struct UserPreferences: Codable {

    // Dietary Restrictions & Preferences
    var allergies: Set<Allergy> = []// Array of allergy strings
    var intolerances: Set<Intolerance> = [] // Array of intolerance strings
    var dietaryChoices: Set<DietaryChoice> = [] // Enum for vegetarian, vegan, etc.
    var specificRestrictions: Set<SpecificRestriction> = [] // Array of specific restriction strings (keto, paleo, etc.)

    // & Wellness Goals
    var weightManagementGoal: WeightManagementGoal = WeightManagementGoal.placeHolder // Enum for gain, lose, maintain
    var healthConditions: Set<HealthCondition> = [] // Array of health condition strings
    var nutrientPreferences: Set<NutrientPreference> = [] // Array of preferred nutrient strings (high protein, low sodium, etc.)
    var fitnessGoals: Set<FitnessGoal> = []// Array of fitness goal strings (muscle building, athletic performance, etc.)

    // Habits & Skills
    var cookingExperience: CookingExperienceLevel = CookingExperienceLevel.placeHolder // Enum for beginner, intermediate, advanced
    var preferredCookingMethods: Set<PreferredCookingMethod> = [] // Array of preferred cooking method strings
    var timeConstraints: TimeConstraint = TimeConstraint.placeHolder // Enum for quick meals, elaborate dishes, etc.

    // & Preferences
    var cuisinePreferences: Set<CuisinePreference> = [] // Array of preferred cuisine strings
    var flavourProfiles: Set<FlavourProfile> = [] // Array of preferred flavour profile strings (spicy, sweet, savory, etc.)
    var occasion: MealOccasion = MealOccasion.placeHolder // Enum for weeknight meals, festive dishes, etc.
    var culturalCuisineOpenness: CulturalOpenness = CulturalOpenness.placeHolder // Enum for exploring new or familiar cuisines
    
    
}

protocol Preference: RawRepresentable, CaseIterable, Hashable, Identifiable, Codable where RawValue == String {
    static func getDescription() -> String

}

extension Preference{
    var id: String {
        return self.rawValue
    }
}

enum DietaryChoice: String, Preference {
    static func getDescription() -> String {
        return "Do you have any dietary preference?"
    }
    
    case omnivore = "Omnivore"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    case pescatarian = "Pescatarian"
    case glutenFree = "Gluten-free"
    case dairyFree = "Dairy-free"
    case nutFree = "Nut-free"
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
    
    static func getDescription() -> String {
        
        return "Do you have any allergies?"
    }
}

enum Intolerance: String, Preference {
    case lactose = "Lactose"
    case gluten = "Gluten"
    case fructose = "Fructose"
    case histamine = "Histamine"
    case sulfites = "Sulfites"
    case none = "None"
    case placeHolder = ""
    
    static func getDescription() -> String {
        
        return "Do you have any food intolerances?"
    }
}

enum SpecificRestriction: String, Preference {
    case keto = "Keto"
    case paleo = "Paleo"
    case lowCarb = "Low-carb"
    case lowSodium = "Low-sodium"
    case highProtein = "High-protein"
    case none = "None"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "Do you follow any specific dietary restrictions?"
    }
}

enum WeightManagementGoal: String, Preference {
    case gain = "Gain weight"
    case lose = "Lose weight"
    case maintain = "Maintain weight"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What is your weight management goal?"
    }
}

enum HealthCondition: String, Preference {
    case diabetes = "Diabetes"
    case heartDisease = "Heart disease"
    case allergies = "Allergies"
    case celiacDisease = "Celiac disease"
    case highBloodPressure = "High blood pressure"
    case cholesterol = "High cholesterol"
    case none = "None"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "Do you have any health conditions?"
    }
}

enum NutrientPreference: String, Preference {
    case highProtein = "High protein"
    case lowSodium = "Low sodium"
    case lowFat = "Low fat"
    case highFiber = "High fiber"
    case lowSugar = "Low sugar"
    case highIron = "High iron"
    case lowCarb = "Low carb"
    case none = "None"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "Do you have any nutrient preferences?"
    }
}

enum FitnessGoal: String, Preference {
    case muscleBuilding = "Muscle building"
    case weightLoss = "Weight loss"
    case athleticPerformance = "Athletic performance"
    case generalFitness = "General fitness"
    case flexibility = "Improved flexibility"
    case endurance = "Increased endurance"
    case none = "None"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What are your fitness goals?"
    }
}

enum CookingExperienceLevel: String, Preference {
    case beginner = "Beginner"
    case intermediate = "Intermediate"
    case advanced = "Advanced"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What is your cooking experience level?"
    }
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
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What are your preferred cooking methods?"
    }
}

enum TimeConstraint: String, Preference {
    case quick = "Quick meals (30 minutes or less)"
    case moderate = "Moderate time commitment (30-60 minutes)"
    case elaborate = "Elaborate dishes (over 60 minutes)"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "Do you have any time constraints for cooking?"
    }
}

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
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What are your preferred cuisines?"
    }
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
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What are your preferred flavour profiles?"
    }
}

enum CulturalOpenness: String, Preference {
    case exploreNew = "Open to exploring new cuisines"
    case familiar = "Prefer familiar cuisines"
    case balanced = "Open to both new and familiar cuisines"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "Are you open to exploring new cuisines?"
    }
}

enum MealOccasion: String, Preference {
    case weeknight = "Weeknight meals"
    case weekend = "Weekend meals"
    case festive = "Festive dishes"
    case placeHolder = ""
    
    static func getDescription() -> String {
        return "What are your typical meal occasions?"
    }
}
