//
//  WideButtonView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI

struct WideButtonView: View {
    
    let action: () -> ()
    let text: String
    
    var body: some View {
        Button(action: { action() }) {
            HStack {
                Spacer()
                Text(text)
                    .font(.title3)
                    .padding(.vertical, 20)
                Spacer()
            }
            .padding(.horizontal, 30)
            .background(Color.black.opacity(0.1))
            .cornerRadius(20)
        }
    }
}

#Preview {
    WideButtonView(action: {}, text: "Start Run")
}
