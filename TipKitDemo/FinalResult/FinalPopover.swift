//
//  FinalPopover.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-09.
//

import SwiftUI
import TipKit

struct FavoriteTip: Tip {
    
    @Parameter static var isLoggedIn: Bool = false
    
    var title: Text {
        Text("Mark as favorite")
    }

    var message: Text? {
        Text("Remember it forever")
    }
    
    var image: Image? {
        Image(systemName: "star")
    }
    
    var actions: [Action] {
        Action(title: "Read more")
    }
    
    var rules: [Rule] {
        #Rule(Self.$isLoggedIn) {
            $0 == true
        }
    }
}

struct FinalPopoverExample: View {
    
    @State var isFavorite = false
    @State var isLoggedIn = false
    
    private let favoriteTip = FavoriteTip()

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
                    favoriteTip.invalidate(reason: .actionPerformed)
                }) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                }
                .popoverTip(favoriteTip, action: { _ in
                    print("Read more")
                })
            })
        }
        .onChange(of: isLoggedIn) { _, newValue in
            if newValue {
                FavoriteTip.isLoggedIn = true
            }
        }
    }
    
    /*
     Step 2. Show popover example, invalidate on button pressed
     
     Step 3. Move back to Inline example
     
     Step 4. Add an action to the popover
     
     Step 5. What if we want to do this more dynamically?
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
    FinalPopoverExample()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure()
        }
}
