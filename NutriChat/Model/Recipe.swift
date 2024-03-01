//
//  Recipe.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-25.
//

import Foundation

struct Recipe: Hashable, Decodable{
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var name: String = ""
    var category: String
    var ingredients: [String]
    var steps: [String]
    var tags: [String]
    
    init(name: String, category: String, ingredients: [String], steps: [String], tags: [String]) {
        self.name = name
        self.category = category
        self.ingredients = ingredients
        self.steps = steps
        self.tags = tags
    }
    
    private enum CodingKeys: String, CodingKey {
            case name
            case category
            case ingredients
            case steps
            case tags
        }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            category = try container.decode(String.self, forKey: .category)
            ingredients = try container.decode([String].self, forKey: .ingredients)
            steps = try container.decode([String].self, forKey: .steps)
            tags = try container.decode([String].self, forKey: .tags)
        }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name+category+steps.joined()+tags.joined())
    }
}
