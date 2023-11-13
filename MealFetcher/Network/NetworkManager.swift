//
//  NetworkManager.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 11/12/23.
//

import Foundation

class NetworkManager {
    private let mealsUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    static let shared = NetworkManager()
    private init() {}
    
    func fetchMeals(completion: @escaping ([Meal]?) -> Void) {
        guard let url = URL(string: mealsUrl) else {
            print("Error: Unable to find meals API url.")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching meals with URLSession: ", error.localizedDescription)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let mealResponse = try? decoder.decode(MealResponse.self, from: data)
                    completion(mealResponse?.meals)
                } catch {
                    print("Error decoding meals data: ", error.localizedDescription)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
