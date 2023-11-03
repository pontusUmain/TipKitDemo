//
//  TipModel.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-11-03.
//

import Foundation

struct TipModels: Codable {
    var tips: [Model]
    
    struct Model: Codable {
        var title: String
        var message: String?
        var id: String
    }
}


