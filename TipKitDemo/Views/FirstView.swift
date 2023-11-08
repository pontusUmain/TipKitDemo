//
//  FirstView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI
import TipKit

struct FirstView: View {
    
    private let tip = TipWithAction()
    @State var showSheet = false
    
    var body: some View {
        VStack {
            Text("Hello world")
            TipView(tip) { action in
                if action.id == "id" {
                    showSheet = true
                } else {
                    print(action.id)
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            Text("Read more")
        }
    }
}

#Preview {
    FirstView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}

struct TipWithAction: Tip {
    var title = Text("Tip with action")
    var actions = [Tips.Action(
        id: "id",
        title: "Read more")
    ]
}
