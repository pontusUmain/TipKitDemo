//
//  TabBarView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-10-27.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
                ContentView().tabItem { Text("Home") }
                SecondView().tabItem { Text("Favorite") }
        }
    }
}

#Preview {
    TabBarView()
}
