//
//  AlertItem.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-23.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissbutton: Alert.Button
}

struct AlertContext{
    static let preferenceSaved = AlertItem(title: Text("Preferences Saved!"), message: Text("You preferences have been saved successfully"), dismissbutton: .default(Text("Yay")))
}
