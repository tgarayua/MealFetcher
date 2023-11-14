//
//  Meal.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/12/23.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    var id: String {
        return idMeal
    }
}
