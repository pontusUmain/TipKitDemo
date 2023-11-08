//
//  PopoverExample.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI
import TipKit

struct FavoriteRunTip: Tip {
    var title: Text {
        Text("Mark as favorite")
    }
    
    var message: Text? {
        Text("And remember it forever")
    }
    
    var actions: [Action] {
        [
            Action(id: "detailPage", title: "Read more")
        ]
    }
}

struct PopoverExample: View {
    
    private let favoriteTip = FavoriteRunTip()
    
    @State var isFavorite = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                recentRuns()
                detailText()
                Spacer()
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
                .popoverTip(favoriteTip) { action in
                    if action.id == "detailPage" {
                        print("I want to know more")
                    }
                }
            })
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
    
}

#Preview {
    PopoverExample()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
