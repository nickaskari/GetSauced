//
//  UtiliyTools.swift
//  Quotes
//
//  Created by Nick Askari on 27/06/2021.
//

import Foundation
import SwiftUI

struct UtilityTools {
    
    func getTapticFeedBack(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impact = UIImpactFeedbackGenerator(style: style)
        impact.impactOccurred()
    }
}
