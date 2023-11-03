//
//  View+Extension.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-03.
//

import Foundation
import SwiftUI
import TipKit

extension View {    
    @ViewBuilder func ifTip(tipId: String) -> some View {
        if let tip = TipConverter.shared.getTipById(tipId) {
           self
                .popoverTip(JsonTip(model: tip))
        } else {
            self
        }
    }
}

