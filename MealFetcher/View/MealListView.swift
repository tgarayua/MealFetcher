//
//  MealListView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject var viewModel = MealViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [.white, .purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                switch viewModel.viewState {
                case .loading:
                    ProgressView("Loading Meals...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                        .scaleEffect(1.5)
                        .padding()
                case .success:
                    VStack {
                        // Search bar
                        TextField("Search Meal", text: $viewModel.searchText)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.purple, lineWidth: 1)
                            )
                            .padding(.horizontal)
                        
                        // Meals list
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(viewModel.filteredMeals, id: \.uuid) { meal in
                                    NavigationLink(destination: MealDetailView(meal: meal)) {
                                        MealCard(meal: meal)
                                    }
                                }
                            }
                            .padding(.top, 8)
                        }
                        .refreshable {
                            await viewModel.loadMeals()
                        }
                        
                    }
                    .navigationTitle("Meals")
                    .background(Color.white.opacity(0.1))
                case .error(let errorMessage):
                    Text(errorMessage)
                        .font(.headline)
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
        }
        .task {
            await viewModel.loadMeals()
        }
    }
}


#Preview {
    MealListView()
}
