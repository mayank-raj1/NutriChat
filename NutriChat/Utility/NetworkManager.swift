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
        print("Nd")
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: userData)
            return data
        } catch {
            return Data()
        }
    }
}
