//
//  MealsViewModel.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/13/23.
//

import Foundation

class MealsViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    func fetchMealsVM() {
        NetworkManager.shared.fetchMeals { [weak self] meals in
            DispatchQueue.main.async {
                self?.meals = meals ?? []
            }
        }
    }
}
