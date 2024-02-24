//
//  PrefrenceStartView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct PrefrenceStartView: View {
    var body: some View {
        VStack{
            Image("getToKnow").resizable().aspectRatio(contentMode: .fit).frame(width: 400)
            Text("Lets get you know about you!").font(.largeTitle).multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PrefrenceStartView()
}
