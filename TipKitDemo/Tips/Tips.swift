//
//  Tips.swift
//  TipKitDemo
//
//  Created by Pontus Croneld on 2023-10-27.
//

import Foundation
import TipKit

struct FirstTip: Tip {
    var title: Text {
        Text("This is a tip")
    }
    
    var message: Text? {
        Text("With some minor information")
    }
}

struct FavoriteTip: Tip {
    
    static let didPressFavorite: Event = Event(id: "didPressFavorite")
    
    var title: Text {
        Text("Mark as favorite")
    }
    
    var message: Text? {
        Text("Click the star to mark image as favorite")
    }
    
    var rules: [Rule] {
        #Rule(Self.didPressFavorite) {
            $0.donations.count < 1
        }
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

