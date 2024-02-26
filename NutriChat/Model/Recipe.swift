//
//  Recipe.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-25.
//

import Foundation

struct Recipe: Identifiable, Hashable{
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var id = UUID()
    var name: String = ""
    var category: String
    var steps: [String]
    var tags: [String]
    
    init(name: String, catagory: String, steps: [String], tags: [String]) {
        self.name = name
        self.category = catagory
        self.steps = steps
        self.tags = tags
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name+category+steps.joined()+tags.joined())
    }
}
