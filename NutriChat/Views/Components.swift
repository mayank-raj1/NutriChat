//
//  Components.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-03-03.
//

import SwiftUI

struct Components: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct BrightButton: View {
    var text: String
    var systemImage: String = ""

    var body: some View {
        Label(text, systemImage: systemImage).dynamicTypeSize(.xxxLarge).bold()
            .foregroundStyle(.hard)
            .padding().background(.bright).clipShape(.buttonBorder)
    }
}

#Preview {
    BrightButton(text: "Generate")
}
