//
//  RecipeBook.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-26.
//

import Foundation

final class RecipeBook: ObservableObject{
    @Published var recipes: [Recipe]
    init() {
        self.recipes = []
    }
}
