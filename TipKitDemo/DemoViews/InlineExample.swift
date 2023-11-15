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

struct InlineExample: View {
        
    @State var isLoggedIn: Bool = false
        
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView {
                        recentRuns()
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
    
    private func shareSection() -> some View {
        ShareView(friends: Person.demo)
            .padding(.horizontal, 20)
    }
    
    private func startRun() -> some View {
        WideButtonView(action: {
            // Event action
        }, text: "Start run")
        .padding(.horizontal, 20)
    }
    
    private func loginButton() -> some View {
        WideButtonView(action: {
            isLoggedIn.toggle()
            // Parameter action
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
}
