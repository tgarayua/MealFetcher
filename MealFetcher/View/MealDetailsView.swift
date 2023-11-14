//
//  MealDetailsView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/13/23.
//

import SwiftUI

struct MealDetailsView: View {
    let meal: Meal

    @State private var mealDetail: MealDetail?

    var body: some View {
        ScrollView {
            VStack {
                MealCardView(meal: meal)
                if let mealDetail = mealDetail {
                    Text("Instructions:")
                        .font(.headline)
                        .padding()

                    Text(mealDetail.strInstructions ?? "Not Available")
                        .padding()

                    Text("Ingredients:")
                        .font(.headline)
                        .padding()

                    // Display unique ingredients and measurements
                    
                    Text("\(mealDetail.strIngredient1 ?? "N/A") : \(mealDetail.strMeasure1 ?? "N/A")")
                    Text("\(mealDetail.strIngredient2 ?? "N/A") : \(mealDetail.strMeasure2 ?? "N/A")")
                    Text("\(mealDetail.strIngredient3 ?? "N/A") : \(mealDetail.strMeasure3 ?? "N/A")")
                    Text("\(mealDetail.strIngredient4 ?? "N/A") : \(mealDetail.strMeasure4 ?? "N/A")")
                    Text("\(mealDetail.strIngredient5 ?? "N/A") : \(mealDetail.strMeasure5 ?? "N/A")")
                    Text("\(mealDetail.strIngredient6 ?? "N/A") : \(mealDetail.strMeasure6 ?? "N/A")")
                    Text("\(mealDetail.strIngredient7 ?? "N/A") : \(mealDetail.strMeasure7 ?? "N/A")")

                } else {
                    ProgressView("Loading...")
                }
            }
            .padding()
        }
        .navigationTitle(meal.strMeal)
        .onAppear {
            NetworkManager.shared.fetchMealDetails(with: meal.idMeal) { fetchedMealDetail in
                DispatchQueue.main.async {
                    self.mealDetail = fetchedMealDetail
                }
            }
        }
    }
}


//struct MealDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailsView(meal: <#Meal#>)
//    }
//}
