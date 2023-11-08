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
                            .ifTip(tipId: "second")
                        tipSection()
                        shareSection()
                    }
                    Spacer()
                    startRun()

                }
                .navigationTitle("Example of Inline")
        }
    }
    
    /*
     
     Step 5. Show externally fetched tips, inline and popover
     
     Step 6. If there's time, configure the look of the tips in one of the views
     
     */
    
    @ViewBuilder
    private func tipSection() -> some View {
        if let tip = tipConverter.tips.first(where: { $0.id == "first" }) {
            TipView(tip)
                .padding(.horizontal, 20)
        } else {
            EmptyView()
        }

    }
    
    private func shareSection() -> some View {
        ShareView(friends: Person.demo)
            .padding(.horizontal, 20)
    }
    
    private func startRun() -> some View {
        StartRunView(action: {
            HistoryTip.didStartARun.sendDonation()
        })
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
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
