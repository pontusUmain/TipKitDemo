//
//  ContentView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-10-23.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    private let tipConverter = TipConverter.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                makeTip()
                headerImage()
            }
            .padding()
        }
        .navigationTitle("Home")
    }
    
    func headerImage() -> some View {
        Image("monkey")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    @ViewBuilder
    func makeTip() -> some View {
        VStack {
            if let firstTip = tipConverter.tips.first(where: { $0.id == "first" }){
                TipView(firstTip)
            }
        }
    }
}

#Preview {
    ContentView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
