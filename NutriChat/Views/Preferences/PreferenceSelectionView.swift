//
//  PrefrenceSlectionView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-14.
//

import SwiftUI

struct PrefrenceSlectionView<commonEnum: Prefrence>: View {
    let prefrence: commonEnum.Type
    var body: some View {
        HStack{
            prefrence.allCases.forEach { pref in
                Text("\(pref)")
            }
        }
    }
}

#Preview {
    PrefrenceSlectionView(prefrence: DietaryChoice.self)
}
