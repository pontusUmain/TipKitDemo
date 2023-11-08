//
//  StartRunView.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI

struct StartRunView: View {
    
    let action: () -> ()
    
    var body: some View {
        Button(action: { action() }) {
            HStack {
                Spacer()
                Text("Start run")
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
    StartRunView(action: {})
}
