//
//  SquareCard.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-08.
//

import SwiftUI

struct RunView: View {
    struct Model {
        let length: String
        let time: String
        let day: String
    }
    
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Image(.shoe)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                
                Spacer()
                
                Text(model.day)
            }
            
            VStack(alignment: .leading) {
                Text(model.length)
                    .font(.title)
                Text(model.time)
                
            }
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 20)
        .background(.green.opacity(0.6))
        .cornerRadius(20)

    }
}

extension RunView.Model {
    static let monday = RunView.Model(length: "10km", time: "55 min", day: "Monday")
    static let thursday = RunView.Model(length: "10km", time: "52 min", day: "Thursday")
}

#Preview {
    RunView(model: .monday)
}

