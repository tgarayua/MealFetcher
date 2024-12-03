//
//  MealService.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMeals() async throws -> [Meal]
}

class MealService: MealServiceProtocol {
    private let service: ApiServiceProtocol
    
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
    }
    
    func fetchMeals() async throws -> [Meal] {
        guard let url = URL(string: ApiConstants.recipesUrl) else { throw URLError(.badURL) }
        let mealServiceResponse: MealResponse = try await service.fetchData(from: url)
        return mealServiceResponse.recipes
    }
}
