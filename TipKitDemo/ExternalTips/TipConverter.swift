//
//  TipConverter.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-03.
//

import Foundation
import SwiftUI
import TipKit

// Model for Json-file
struct TipModels: Codable {
    var tips: [Model]
    
    struct Model: Codable {
        var title: String
        var message: String?
        var id: String
    }
}

class TipConverter {
    static var shared = TipConverter()
    
    init() {
        let tipModels = Bundle.main.decode(TipModels.self, from: "tips.json")
    }
    
    func invalidateTipById(_ id: String) {
    }
}

