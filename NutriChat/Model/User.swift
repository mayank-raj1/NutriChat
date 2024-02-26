//
//  User.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-16.
//

import Foundation
import SwiftUI

final class User: ObservableObject, Identifiable, Codable{
    var id: String
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String

    @Published var preferences: UserPreferences = UserPreferences()
    
    init(firstName: String = "", lastName: String = "", age: Int = 18, gender: String = "") {
        self.id = UUID().uuidString
        self.firstName = firstName
        self.lastName = lastName
        self.preferences = UserPreferences()
        self.age = age
        self.gender = gender
    }
    
    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, preferences, age, gender
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.preferences = try container.decode(UserPreferences.self, forKey: .preferences)
        self.age = try container.decode(Int.self, forKey: .age)
        self.gender = try container.decode(String.self, forKey: .gender)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(preferences, forKey: .preferences)
        try container.encode(age, forKey: .age)
        try container.encode(gender, forKey: .gender)
    }
}
