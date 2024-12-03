//
//  MealDetailView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header Image
                AsyncImage(url: URL(string: meal.largePhoto ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 250)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .cornerRadius(12)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .foregroundColor(.gray)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(12)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.horizontal)
                
                // Meal Information
                VStack(alignment: .leading, spacing: 12) {
                    Text(meal.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(meal.cuisine)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    // Description or additional information
                    Text("Delicious \(meal.name) from \(meal.cuisine) cuisine. Enjoy making this dish using the recipe provided.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                
                // Buttons
                HStack(spacing: 16) {
                    // View Recipe Button
                    if let sourceUrl = URL(string: meal.sourceUrl ?? "") {
                        Link(destination: sourceUrl) {
                            Text("View Recipe")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color.purple.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    
                    // Watch YouTube Button
                    if let youtubeUrl = URL(string: meal.youtubeUrl ?? "") {
                        Link(destination: youtubeUrl) {
                            Text("Watch on YouTube")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, minHeight: 44)
                                .background(Color.red.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(LinearGradient(gradient: Gradient(colors: [.white, .purple.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea())
        .navigationTitle(meal.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

