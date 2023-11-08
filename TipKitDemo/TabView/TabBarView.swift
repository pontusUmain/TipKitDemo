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
                InlineExample().tabItem { Text("1") }
                PopoverExample().tabItem { Text("2") }
        }
    }
}

#Preview {
    TabBarView()
}
