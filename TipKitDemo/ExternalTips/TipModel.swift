//
//  TipModel.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-03.
//

import Foundation
import TipKit

struct TipModels: Codable {
    var tips: [Model]
    
    struct Model: Codable {
        var title: String
        var message: String?
        var id: String
    }
}

struct JsonTip: Tip {
    
    let model: TipModels.Model
    
    var id: String {
        model.id
    }
    
    var title: Text {
        Text(model.title)
    }
    
    var message: Text? {
        if let message = model.message {
            return Text(message)
        }
        return nil
    }
}
