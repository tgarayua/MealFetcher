//
//  MealTitleView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/13/23.
//

import SwiftUI

struct MealTitleView: View {
    let meal: Meal
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: meal.strMealThumb))
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width - 75)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(meal.strMeal)
                        .font(.caption)
                }
            }
            .padding([.leading, .bottom], 17)
            .cornerRadius(15)
            .shadow(radius: 15)
        }
        .padding(-20)
    }
}

//struct MealTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealTitleView()
//    }
//}
