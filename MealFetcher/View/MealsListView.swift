//
//  MealsListView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/12/23.
//

import SwiftUI

struct MealsListView: View {
    @StateObject private var viewModel = MealsViewModel()
    @State private var selectedMeal: Meal?
    @State private var selectedIndex: Int?

    var body: some View {
        NavigationView {
            VStack {
                List {
                    SearchBar(text: $viewModel.searchQuery)
                    ForEach(Array(viewModel.filteredMeals.enumerated()), id: \.element.idMeal) { index, meal in
                        NavigationLink(
                            destination: MealDetailsView(meal: meal),
                            tag: index,
                            selection: $selectedIndex
                        ) {
                            MealCardView(meal: meal)
                                .padding()
                                .onTapGesture {
                                    selectedMeal = meal
                                    selectedIndex = index
                                }
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
            .ignoresSafeArea(edges: .bottom)
            .onAppear {
                viewModel.fetchMealsVM()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealsListView()
    }
}
