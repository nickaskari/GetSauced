//
//  BottleView.swift
//  Quotes
//
//  Created by Nick Askari on 18/06/2021.
//

import SwiftUI

struct BottleView: View {
    @ObservedObject var premium = PremiumBottles()
    var bottle: String
    
    init(_ bottle: String) {
        self.bottle = bottle
    }
    
    var body: some View {
        let bottleRatio: CGFloat = CGFloat(premium.dictionary[bottle] ?? 1)
        ZStack {
            Image(bottle)
                .resizable()
                .padding()
                .aspectRatio(bottleRatio, contentMode: .fit)
        }
    }
}

