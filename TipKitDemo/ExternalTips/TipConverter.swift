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

struct DownloadedTip: Tip {
    let model: TipModels.Model
    
    var title: Text {
        Text(model.title)
    }
    
    var message: Text? {
        if let message = model.message {
            Text(message)
        } else {
            nil
        }
    }
    
    var id: String {
        model.id
    }
}

class TipConverter {
    static var shared = TipConverter()
    let tips: [DownloadedTip]
    
    init() {
        let tipModels = Bundle.main.decode(TipModels.self, from: "tips.json")
        tips = tipModels.tips.map({ DownloadedTip(model: $0) })
    }
    
    func invalidateTipById(_ id: String) {
    }
}

