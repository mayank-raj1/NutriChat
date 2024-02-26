//
//  Recipe.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-25.
//

import Foundation

final class Recipe: ObservableObject, Identifiable, Hashable{
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var id = UUID()
    var name: String = ""
    var catagory: String
    var steps: String
    var tags: [String]
    
    init(name: String, catagory: String, steps: String, tags: [String]) {
        self.name = name
        self.catagory = catagory
        self.steps = steps
        self.tags = tags
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name+catagory+steps+tags.joined())
    }
}
