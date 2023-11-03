//
//  SecondView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-10-25.
//

import SwiftUI
import TipKit

struct SecondView: View {
    
    private let tipConverter = TipConverter.shared
    private let buttonTip = FavoriteTip()
    @State var isFavorite: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Image("monkey")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(alignment: .topTrailing) {
                        imageButton()
                            .ifTip(tipId: "second")
                    }
            }
            .padding()
            .navigationTitle("Favorite")
        }
    }
    
    private func imageButton() -> some View {
        Button(action: {
            isFavorite.toggle()
//            FavoriteTip.didPressFavorite.sendDonation()
        }){
            Image(systemName: "star.fill")
                .resizable()
                .foregroundColor(isFavorite ? .yellow : .white)
                .frame(width: 44, height: 44)
                .scaleEffect(isFavorite ? 1 : 0.8)
                .padding()
        }
    }
}

#Preview {
    SecondView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
