//
//  InlineExample.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

/*
 
 Step 0. Configure tips to be shown by adding Tips.configure()
 
 Step 1. Show off inline example, configure the look of it
 
 Step 2. Move to next page
 
 Step 3. Add an event based rule, then a parameter based rule
 
 Step 4. Move to next page
 
 */

import SwiftUI
import TipKit

struct ShareTip: Tip {
    
    @Parameter static var isLoggedIn: Bool = false
    
    static var didPressRun = Event(id: "didPressRun")
    
    var title: Text {
        Text("Share your progress with your friends")
    }
    
    var message: Text? {
        Text("If you have any")
    }
    
    var rules: [Rule] {
        [
        #Rule(Self.didPressRun) {
            $0.donations.count > 0
        },
        #Rule(Self.$isLoggedIn) {
            $0 == true
        }
        ]
    }
}

struct InlineExample: View {
        
    private var shareTip = ShareTip()
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView {
                        recentRuns()
                        tipSection()
                        shareSection()
                        startRun()
                        if !isLoggedIn {
                            loginButton()
                        }
                    }
                }
                .navigationTitle("Example of Inline")
        }
    }
    
    private func tipSection() -> some View {
        TipView(shareTip)
            .tipBackground(Color.blue.opacity(0.2))
            .tipCornerRadius(20)
            .padding(.horizontal)
    }
    
    private func shareSection() -> some View {
        ShareView(friends: Person.demo)
            .padding(.horizontal, 20)
    }
    
    private func startRun() -> some View {
        WideButtonView(action: {
            ShareTip.didPressRun.sendDonation()
        }, text: "Start run")
        .padding(.horizontal, 20)
    }
    
    private func loginButton() -> some View {
        WideButtonView(action: {
            isLoggedIn.toggle()
            ShareTip.isLoggedIn.toggle()
        }, text: "Log in")
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
            try? Tips.configure()
        }
}
