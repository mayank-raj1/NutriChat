//
//  NetworkManager.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-03-01.
//

import Foundation
import SwiftUI

struct NetworkManager{
    private var url = URL(string: "http://127.0.0.1:5000/suggest")
    func getRecipes(_ userData: Data) async throws -> Data{
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = userData
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                throw NCError.networkError
            }
            return data
        } catch {
            return Data(userData)
        }
    }
}
