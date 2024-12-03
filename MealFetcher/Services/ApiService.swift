//
//  ApiService.swift
//  MealFetcher
//
//  Created by Thomas Garayua on 12/2/24.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}

class ApiService: ApiServiceProtocol {
    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let apiResponse = try JSONDecoder().decode(T.self, from: data)
        return apiResponse
    }
}
