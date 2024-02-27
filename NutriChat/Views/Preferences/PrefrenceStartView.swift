//
//  PrefrenceStartView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-13.
//

import SwiftUI

struct PrefrenceStartView: View {
    @Binding var pageNumber: Int
    var body: some View {
        VStack{
            Image("getToKnow").resizable().aspectRatio(contentMode: .fit).frame(width: 380)
            Text("Let's get to know about you!")
                .font(.largeTitle).multilineTextAlignment(.center).padding()
            Button(action: {pageNumber += 1}, label: {
                Text("Dish Out the Details!").font(.title2).padding(10).frame(maxWidth: .infinity)
            }).buttonStyle(.borderedProminent).padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

//#Preview {
//    PrefrenceStartView()
//}
