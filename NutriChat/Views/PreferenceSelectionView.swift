//
//  PrefrenceSlectionView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-14.
//

import SwiftUI

struct PreferenceSingleSelectionView<commonEnum: Preference>: View {
    @Binding var preference: commonEnum?
    var body: some View {
        VStack{
            List(commonEnum.getAllCasses(), id: \.self, selection: $preference) { pre in
                Text(pre.rawValue)
            }
        }
    }
}

//#Preview {
//    PreferenceSingleSelectionView(preference: .constant(DietaryChoice.none))
//}

struct PreferenceMultipleSelectionView<commonEnum: Preference>: View {
    //@Binding var preferences: [commonEnum]?
    @Binding var preferences: Set<commonEnum>
    var body: some View {
        VStack{
            List(commonEnum.getAllCasses(), id: \.self, selection: $preferences) { pref in
                Text(pref.rawValue)
            }
            
        }
    }
}

#Preview {
    PreferenceMultipleSelectionView(preferences:  .constant([DietaryChoice.dairyFree, DietaryChoice.glutenFree]))
}
