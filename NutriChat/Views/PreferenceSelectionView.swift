//
//  PrefrenceSlectionView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-14.
//

import SwiftUI

struct PreferenceSingleSelectionView<commonEnum: Preference>: View {
    @Binding var preference: commonEnum
    
    var body: some View {
        VStack{
            List{
                ForEach(commonEnum.getAllCasses(), id: \.self) { caseValue in
                    if caseValue.rawValue != ""{
                        HStack{
                            Text(caseValue.rawValue)
                            Spacer()
                            if caseValue == preference{
                                Image(systemName: "checkmark")
                            }
                        }.onTapGesture{
                            print("nmk")
                            self.preference = caseValue
                        }
                    }
                }
            }
        }
    }
}

struct PreferenceMultipleSelectionView<commonEnum: Preference>: View {
    @Binding var preference: [commonEnum]
    
    var body: some View {
        VStack{
            List{
                ForEach(commonEnum.getAllCasses(), id: \.self) { caseValue in
                    if caseValue.rawValue != ""{
                        HStack{
                            Text(caseValue.rawValue)
                            Spacer()
                            if contains(caseValue){
                                Image(systemName: "checkmark")
                            }
                        }.onTapGesture{
                            if caseValue.rawValue == "None"{
                                handleNone(caseValue)
                            }else{
                                addValue(caseValue)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func contains(_ value: commonEnum) -> Bool{
        return preference.contains(value)
    }
    
    private func handleNone(_ noneValue: commonEnum) -> Void{
        preference.removeAll()
        preference.append(noneValue)
    }
    
    private func addValue(_ value: commonEnum) -> Void{
        preference.removeAll { item in
            item.rawValue == "None"
        }
        if !contains(value){
            preference.append(value)
        }else{
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
