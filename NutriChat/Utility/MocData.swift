//
//  MocData.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-12.
//

import Foundation

struct MocDataGenerator {
    
    static func generateMocUser() -> User{
        return User()
    }
    
    static let recipe1 = Recipe(
            name: "Vegan Gluten-Free Pancakes",
            category: "Breakfast",
            ingredients: [
                "1 cup gluten-free flour",
                "1 tsp baking powder",
                "Pinch of salt",
                "1 cup almond milk",
                "2 tbsp maple syrup",
                "1 tsp vanilla extract"
            ],
            steps: [
                "1. In a mixing bowl, whisk together gluten-free flour, baking powder, and salt.",
                "2. Add almond milk, maple syrup, and vanilla extract. Stir until well combined.",
                "3. Heat a non-stick pan over medium heat and lightly grease with oil or cooking spray.",
                "4. Pour batter onto the pan to form pancakes. Cook until bubbles form on the surface, then flip and cook until golden brown.",
                "5. Serve warm with your favorite toppings such as fresh fruit, maple syrup, or vegan butter."
            ],
            tags: ["Vegan", "Gluten-Free"]
        )

        static let recipe2 = Recipe(
            name: "Mushroom Risotto",
            category: "Main Dish",
            ingredients: [
                "1 cup Arborio rice",
                "2 cups vegetable broth",
                "8 oz mushrooms, sliced",
                "1 onion, diced",
                "2 cloves garlic, minced",
                "1/4 cup grated Parmesan cheese"
            ],
            steps: [
                "1. In a large skillet, heat olive oil over medium heat.",
                "2. Add diced onions and garlic, sauté until softened.",
                "3. Add sliced mushrooms and cook until browned and tender.",
                "4. Stir in Arborio rice and cook for 1-2 minutes until slightly toasted.",
                "5. Gradually add vegetable broth, stirring frequently, until rice is creamy and cooked through.",
                "6. Stir in grated Parmesan cheese, salt, and pepper. Serve hot."
            ],
            tags: ["Italian", "Vegetarian", "Risotto"]
        )

        static let recipe3 = Recipe(
            name: "Grilled Vegetable Salad",
            category: "Salad",
            ingredients: [
                "2 zucchinis, sliced",
                "2 bell peppers, sliced",
                "1 red onion, sliced",
                "1 eggplant, sliced",
                "2 tbsp olive oil",
                "Salt and pepper, to taste",
                "Mixed greens",
                "Cherry tomatoes",
                "Balsamic vinaigrette"
            ],
            steps: [
                "1. Preheat grill to medium-high heat.",
                "2. Toss sliced vegetables with olive oil, salt, and pepper.",
                "3. Grill vegetables until charred and tender, about 5-7 minutes per side.",
                "4. Let vegetables cool slightly, then chop into bite-sized pieces.",
                "5. In a large bowl, combine grilled vegetables with mixed greens, cherry tomatoes, and balsamic vinaigrette.",
                "6. Toss salad until evenly coated. Serve immediately."
            ],
            tags: ["Vegetarian", "Grilled", "Salad"]
        )

        static let recipe4 = Recipe(
            name: "Teriyaki Tofu Stir-Fry",
            category: "Main Dish",
            ingredients: [
                "1 block tofu, pressed and cubed",
                "2 tbsp sesame oil",
                "Assorted vegetables (broccoli, bell peppers, snap peas)",
                "1/4 cup soy sauce",
                "2 tbsp rice vinegar",
                "2 tbsp honey",
                "2 cloves garlic, minced",
                "1 tsp ginger, grated",
                "Cooked rice or noodles",
                "Sliced green onions",
                "Sesame seeds"
            ],
            steps: [
                "1. Press tofu to remove excess moisture, then cut into cubes.",
                "2. Heat sesame oil in a large skillet or wok over medium-high heat.",
                "3. Add cubed tofu and cook until golden brown on all sides.",
                "4. Push tofu to one side of the skillet and add chopped vegetables. Cook until tender-crisp.",
                "5. In a small bowl, mix together soy sauce, rice vinegar, honey, garlic, and ginger. Pour over tofu and vegetables.",
                "6. Cook for another 2-3 minutes until sauce has thickened and coated tofu and vegetables.",
                "7. Serve over cooked rice or noodles. Garnish with sliced green onions and sesame seeds."
            ],
            tags: ["Asian", "Vegan", "Stir-Fry"]
        )

        static let recipe5 = Recipe(
            name: "Banana Chocolate Chip Muffins",
            category: "Dessert",
            ingredients: [
                "2 ripe bananas, mashed",
                "1/4 cup melted butter",
                "1/2 cup brown sugar",
                "1 egg",
                "1 tsp vanilla extract",
                "1 cup all-purpose flour",
                "1 tsp baking powder",
                "1/2 tsp baking soda",
                "Pinch of salt",
                "1/2 cup chocolate chips"
            ],
            steps: [
                "1. Preheat oven to 375°F (190°C). Line a muffin tin with paper liners or grease with cooking spray.",
                "2. In a large bowl, mash ripe bananas with a fork.",
                "3. Stir in melted butter, brown sugar, egg, and vanilla extract until well combined.",
                "4. In a separate bowl, whisk together flour, baking powder, baking soda, salt, and chocolate chips.",
                "5. Add dry ingredients to wet ingredients and mix until just combined.",
                "6. Divide batter evenly among muffin cups. Top with additional chocolate chips if desired.",
                "7. Bake for 18-20 minutes, or until a toothpick inserted into the center comes out clean.",
                "8. Allow muffins to cool in the pan for 5 minutes, then transfer to a wire rack to cool completely."
            ],
            tags: ["Baking", "Dessert", "Banana"]
        )
    static let recipes = [recipe1, recipe2, recipe3, recipe3, recipe4, recipe5]
}
