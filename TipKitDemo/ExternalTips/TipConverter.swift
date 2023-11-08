//
//  TipConverter.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-03.
//

import Foundation
import SwiftUI
import TipKit

class TipConverter {
    static var shared = TipConverter()
    let tips: [JsonTip]
    
    init() {
        let tipModels = Bundle.main.decode(TipModels.self, from: "tips.json")
        tips = tipModels.tips.map { JsonTip(model: $0) }
    }
    
    func invalidateTipById(_ id: String) {
        if let tip = tips.first(where: { $0.id == id }) {
            tip.invalidate(reason: .actionPerformed)
        }
    }
}
