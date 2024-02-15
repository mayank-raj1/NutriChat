//
//  PrefrenceSlectionView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-14.
//

import SwiftUI

struct PrefrenceSlectionView<commonEnum: Prefrence>: View {
    @Binding var prefrence: commonEnum?
    var enumType: commonEnum.Type
    var body: some View {
        HStack{
            List(DietaryChoice.allCases, id: \.self) { pre in
                Text(pre.rawValue)
            }
        }
    }
}

#Preview {
    PrefrenceSlectionView(prefrence: .constant(DietaryChoice.dairyFree), enumType: DietaryChoice.self)
}
