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
    @Published var firstName: String
    @Published var lastName: String
    @Published var age: Int
    @Published var sex: String
    let sexes = ["Male", "Female", "Other"]
    @Published var preferences: UserPreferences = UserPreferences()
    
    init(firstName: String = "", lastName: String = "", age: Int = 18, sex: String = "other") {
        self.id = UUID().uuidString
        self.firstName = firstName
        self.lastName = lastName
        self.preferences = UserPreferences()
        self.age = age
        self.sex = sex
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
        self.sex = try container.decode(String.self, forKey: .gender)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(preferences, forKey: .preferences)
        try container.encode(age, forKey: .age)
        try container.encode(sex, forKey: .gender)
    }
    
    func replace(with: User) -> Void{
        self.id = with.id
        self.firstName = with.firstName
        self.lastName = with.lastName
        self.preferences = with.preferences
        self.age = with.age
        self.sex = with.sex
    }
}
