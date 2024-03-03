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
    func getRecipes(_ userData: Data) async -> Data{
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = userData
        do {
            let (data, x) = try await URLSession.shared.data(for: request)
            print(data.base64EncodedString())
            print(x)
            return data
        } catch {
            print(error.localizedDescription)
            return Data(userData)
        }
    }
}
