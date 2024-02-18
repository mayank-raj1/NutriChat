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
    var name: String
    
    @Published var preferences: UserPreferences = UserPreferences()
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, preferences
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.preferences = try container.decode(UserPreferences.self, forKey: .preferences)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(preferences, forKey: .preferences)
    }
}
