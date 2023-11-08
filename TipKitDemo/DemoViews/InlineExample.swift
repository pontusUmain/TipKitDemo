//
//  InlineExample.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI
import TipKit

struct HistoryTip: Tip {
    
    static var didStartARun: Event = Event(id: "startedARun")
    
    var title: Text {
        Text("Share your progress")
    }
    
    var message: Text? {
        Text("It's really cool to brag to your friends")
    }
    
    var image: Image? {
        Image(systemName: "shoe")
    }
    
    var options: [TipOption] {
        [
            Tip.MaxDisplayCount(3)
        ]
    }
    
    var rules: [Rule] {
        #Rule(Self.didStartARun) {
            $0.donations.count >= 0
        }
    }
}

struct InlineExample: View {
    
    let historyTip = HistoryTip()
    
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView {
                        recentRuns()
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
     
     Step 1. Show simple inline example, it's now possible to see your history on the main mage!
     
     Step 2. Move to next page
     
     Step 3. Show off maxDisplayCount as an Option, and an event based rule
     
     Step 4. Move to next page
     
     */
    
    private func tipSection() -> some View {
        TipView(HistoryTip())
            .padding(.horizontal, 20)

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
    InlineExample()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
