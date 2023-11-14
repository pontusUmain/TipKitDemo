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
 
 Step 3. Add an event based rule
 
 Step 4. Move to next page
 
 */

import SwiftUI

struct InlineExample: View {
        
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
    
    private func shareSection() -> some View {
        ShareView(friends: Person.demo)
            .padding(.horizontal, 20)
    }
    
    private func startRun() -> some View {
        WideButtonView(action: {
            // Action
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
    InlineExample()
}
