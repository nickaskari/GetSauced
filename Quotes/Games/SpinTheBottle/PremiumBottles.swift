//
//  PremiumBottles.swift
//  Quotes
//
//  Created by Nick Askari on 18/06/2021.
//

import SwiftUI

class PremiumBottles: ObservableObject {
    
    static let premium = ["Dom Perignon": 0.8,
                          "Bollinger": 1.1,
                          "Moet": 1.15,
                          "Macallen": 2.8]
    
    static func createBottles() -> Bottles {
        Bottles(premium)
    }
    
    @Published private var model: Bottles = createBottles()
    
    var bottleNames: Dictionary<String, Double>.Keys {
        model.getBottleNames()
    }
    
    var dictionary: Dictionary<String, Double> {
        model.bottles
    }
}
