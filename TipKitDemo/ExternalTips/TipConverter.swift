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
    
    init() {
        let tipModels = Bundle.main.decode(TipModels.self, from: "tips.json")
    }
    
    func invalidateTipById(_ id: String) {
    }
}
