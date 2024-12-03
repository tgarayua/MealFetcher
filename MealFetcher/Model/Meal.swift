//
//  Meal.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import Foundation

struct MealResponse: Codable {
    let recipes: [Meal]
}

struct Meal: Codable {
    let cuisine: String
    let name: String
    let largePhoto: String?
    let smallPhoto: String?
    let sourceUrl: String?
    let uuid: String
    let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case largePhoto = "photo_url_large"
        case smallPhoto = "photo_url_small"
        case sourceUrl = "source_url"
        case uuid
        case youtubeUrl = "youtube_url"
    }
}
