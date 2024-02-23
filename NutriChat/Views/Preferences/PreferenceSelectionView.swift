//
//  PrefrenceSlectionView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-14.
//

import SwiftUI

protocol PreferenceSelectionScreenStruct{
}

extension PreferenceSelectionScreenStruct {
    func preferenceMultiSection<T: Preference>(title: String, options: [T], selectedOptions: Set<T>, onSelect: @escaping (T) -> Void) -> some View {
        Section(header: Text(title).textCase(.lowercase).font(.subheadline)) {
            ForEach(options, id: \.self) { option in
                if !(option.rawValue == ""){
                    CheckmarkRow(
                        title: option.rawValue,
                        isSelected: selectedOptions.contains(option)
                    ) {
                        onSelect(option)
                    }
                }
            }
        }.headerProminence(.increased)
    }
    
    func preferenceSingleSection<T: Preference>(title: String, options: [T], selectedOptions: T, onSelect: @escaping (T) -> Void) -> some View {
        Section(header: Text(title).textCase(.lowercase).font(.subheadline)) {
            ForEach(options, id: \.self) { option in
                if !(option.rawValue == ""){
                    CheckmarkRow(
                        title: option.rawValue,
                        isSelected: selectedOptions == option
                    ) {
                        onSelect(option)
                    }
                }
            }
        }.headerProminence(.increased)
    }
}

struct CheckmarkRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
