//
//  MealViewModel.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var viewState: ViewState = .loading
    @Published var searchText: String = ""
    private let service: MealServiceProtocol
    
    init(service: MealServiceProtocol = MealService()) {
        self.service = service
    }
    
    var filteredMeals: [Meal] {
        guard !searchText.isEmpty else { return meals }
        return meals.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    func loadMeals() async {
        updateViewState(with: .loading)
        do {
            meals = try await service.fetchMeals()
            updateViewState(with: .success)
        } catch {
            print("Error Loading Meals in MealViewModel: \(error.localizedDescription)")
            updateViewState(with: .error("Error Loading Meals. Please try again later..."))
        }
    }
    
    func updateViewState(with state: ViewState) {
        viewState = state
    }
}
