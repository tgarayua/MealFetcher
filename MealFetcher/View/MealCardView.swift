//
//  MealCardView.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/13/23.
//

import SwiftUI

struct MealCardView: View {
    let meal: Meal
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Spacer()
                AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .clipped()
                            .cornerRadius(30)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: 300, height: 300)
                        Text("Failed to load image")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                    case .empty:
                        ProgressView("Loading...")
                    }
                }
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width - 75)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(meal.strMeal)
                        .font(Font.custom("Baskerville-Bold", size: 26))
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
