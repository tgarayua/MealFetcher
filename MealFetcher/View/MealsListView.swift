//
//  MealsListView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/12/23.
//

import SwiftUI

struct MealsListView: View {
    @StateObject private var viewModel = MealsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.meals, id: \.idMeal) { meal in
                    MealTitleView(meal: meal)
                        .padding()
                }
            }
            .navigationTitle("Meals")
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
