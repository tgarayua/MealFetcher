//
//  MealCard.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import SwiftUI

struct MealCard: View {
    let meal: Meal
    
    var body: some View {
        HStack(spacing: 16) {
            // Meal image
            AsyncImage(url: URL(string: meal.smallPhoto ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            
            // Meal name
            Text(meal.name)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
            
            Spacer()
        }
        .padding(8)
    }
}
