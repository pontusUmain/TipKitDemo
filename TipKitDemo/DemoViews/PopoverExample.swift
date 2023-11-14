//
//  PopoverExample.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI
import TipKit

struct PopoverExample: View {
    
    @State var isFavorite = false
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                recentRuns()
                detailText()
                Spacer()
                if !isLoggedIn {
                    loginButton()
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("Example of Popover")
            .toolbar(content: {
                Button(action: {
                    isFavorite.toggle()
                    // Action
                }) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                }
            })
        }
        .onChange(of: isLoggedIn) { _, newValue in
            if newValue {
            }
        }
    }
    
    /*
     Step 2. Show popover example, invalidate on button pressed
     
     Step 3. Move back to Inline example
     
     Step 4. Add an action to the popover, add a parameter based rule
     
     Step 5. What if we want to fetch tips externally?
     */
    
    private func detailText() -> some View {
        VStack(alignment: .leading) {
            Text("Thursday run")
                .font(.largeTitle)
            Text("A good long run")
        }
    }
    
    private func recentRuns() -> some View {
        RunView(model: .thursday)
    }
    
    private func loginButton() -> some View {
        WideButtonView(action: {
            isLoggedIn = true
        }, text: "Log in")
    }
}

#Preview {
    PopoverExample()
}
