//
//  TipKitDemoApp.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-10-23.
//

import SwiftUI
import TipKit

@main
struct TipKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .task {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
        
        
    }
}
