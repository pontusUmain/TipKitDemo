//
//  PopoverExample.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI
import TipKit

struct DetailButtonTip: Tip {
    var title: Text {
        Text("Mark as favorite")
    }
    
    var actions: [Action] {
        Action(title: "Read more")
    }
}

struct PopoverExample: View {
    
    private let detailTip = DetailButtonTip()
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
                    detailTip.invalidate(reason: .actionPerformed)
                }) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                }
                .popoverTip(detailTip, action: { _ in
                    print("Read more pressed")
                })
            })
        }
    }
    
    /*
     Step 2. Show popover example, invalidate on button pressed, add an action to the popover
     
     Step 3. Move back to Inline example
          
     Step 4. What if we want to fetch tips externally?
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
            try? Tips.configure()
        }
}
