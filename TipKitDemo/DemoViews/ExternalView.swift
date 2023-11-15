//
//  ExternalView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI
import TipKit

struct ExternalView: View {
    
    let tipConverter = TipConverter.shared
    
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView {
                        recentRuns()
                        shareSection()
                    }
                    Spacer()
                    startRun()

                }
                .navigationTitle("Example of Inline")
        }
    }
    
    /*
     
     Step 5. Show externally fetched tips, inline
     
     */
    
    private func shareSection() -> some View {
        ShareView(friends: Person.demo)
            .padding(.horizontal, 20)
    }
    
    private func startRun() -> some View {
        WideButtonView(action: {
        }, text: "Start run")
        .padding(.horizontal, 20)
    }
    
    private func recentRuns() -> some View {
        VStack(alignment: .leading) {
            Text("History")
                .font(.headline)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    RunView(model: .monday)
                    RunView(model: .thursday)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    ExternalView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure()
        }
}
