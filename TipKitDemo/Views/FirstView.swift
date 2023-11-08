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
            Button(action: {}) {
                Text("Button stuff")
            }
            .popoverTip(tip) { action in
                if action.id == "id" {
                    tip.invalidate(reason: .actionPerformed)
                    showThatSheet()
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            Text("Read more")
        }
    }
    
    func showThatSheet() {
        Task {
            try await Task.sleep(for: .seconds(1))
            showSheet = true
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
