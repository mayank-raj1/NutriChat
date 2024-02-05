//
//  MainView.swift
//  NutriChat
//
//  Created by Mayank Raj on 2024-02-05.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            ChatWindowView()
            Divider().frame(height: 12)
            SendField().padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

#Preview {
    MainView().environmentObject(MocDate.chat)
}
