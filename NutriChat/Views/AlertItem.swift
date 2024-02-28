//
//  AlertItem.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-23.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: String
    let message: String
    let dismissbutton: String
}

struct AlertContext{
    static let preferenceSaved = AlertItem(title: "Preferences Saved!", message: "You preferences have been saved successfully", dismissbutton: "Done")
    static let preferenceNotSaved = AlertItem(title: "Error occurred", message: "You preferences were not saved", dismissbutton: "Ok")
    static let dataNotLoaded = AlertItem(title: "Error loading details", message: "There was an error loading your details", dismissbutton: "Ok")
    static let detailsSaved = AlertItem(title: "Details Saved!", message: "You Details have been saved successfully", dismissbutton: "Done")
    static let detailsNotSaved = AlertItem(title: "Error occurred", message: "You details were not saved", dismissbutton: "Ok")
}
