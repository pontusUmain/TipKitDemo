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
                FirstView().tabItem { Text("First") }
                ContentView().tabItem { Text("Home") }
                SecondView().tabItem { Text("Favorite") }
        }
    }
}

#Preview {
    TabBarView()
}
