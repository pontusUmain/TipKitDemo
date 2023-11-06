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
    var tipModels = Bundle.main.decode(TipModels.self, from: "tips.json")
    
    func getTipById(_ id: String) -> TipModels.Model? {
        tipModels.tips.first { $0.id == id }
    }
    
    func tipByIdExists(_ id: String) -> Bool {
        tipModels.tips.contains(where: { $0.id == id })
    }
    
    func invalidateTipById(_ id: String) {
        if let tip = tipModels.tips.first(where: { $0.id == id }) {
            JsonTip(model: tip).invalidate(reason: .actionPerformed)
        }

    }
}
