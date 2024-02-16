//
//  PrefrenceSlectionView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-14.
//

import SwiftUI

struct PreferenceSingleSelectionView<CommonEnum: Preference>: View {
    @Binding var preference: CommonEnum
    
    var body: some View {
        VStack{
            List{
                ForEach(Array(CommonEnum.allCases), id: \.self) { caseValue in
                    if caseValue.rawValue != ""{
                        HStack{
                            Text(caseValue.rawValue)
                            Spacer()
                            if caseValue == preference{
                                Image(systemName: "checkmark")
                            }
                        }.onTapGesture{
                            self.preference = caseValue
                        }
                    }
                }
            }
        }
    }
}

struct PreferenceMultipleSelectionView<CommonEnum: Preference>: View {
    @Binding var preference: [CommonEnum]
    
    var body: some View {
        VStack {
            List {
                ForEach(Array(CommonEnum.allCases), id: \.self) { caseValue in
                    if !caseValue.rawValue.isEmpty {
                        HStack {
                            Text(caseValue.rawValue)
                            Spacer()
                            Image(systemName: self.contains(caseValue) ? "checkmark" : "")
                        }.onTapGesture {
                            caseValue.rawValue == "None" ? self.handleNone(caseValue) : self.addValue(caseValue)
                        }
                    }
                }
            }
        }
    }
    
    private func contains(_ value: CommonEnum) -> Bool {
        return preference.contains(value)
    }
    
    private func handleNone(_ noneValue: CommonEnum) {
        preference.removeAll()
        preference.append(noneValue)
    }
    
    private func addValue(_ value: CommonEnum) {
        preference.removeAll { item in
            item.rawValue == "None"
        }
        if !contains(value) {
            preference.append(value)
        } else {
            preference.removeAll { item in
                item == value
            }
        }
    }
}

//#Preview {
//    PreferenceSingleSelectionView(preference: DietaryChoice.placeHolder)
//    PreferenceMultipleSelectionView(preference: [DietaryChoice.placeHolder])
//}
