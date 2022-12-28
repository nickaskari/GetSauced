//
//  SpinTheBottleView.swift
//  Quotes
//
//  Created by Nick Askari on 13/06/2021.
//

import SwiftUI
import AVFoundation

struct SpinTheBottleView: View {
    @State private var degrees = 90.0
    var bottle: BottleView
    
    init(_ bottle: BottleView) {
        self.bottle = bottle  
    }
    
    var body: some View {
        ZStack {
            Color.orange
                .opacity(1)
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                withAnimation(Animation.linear(duration: 1.7
                )) {
                    AudioServicesPlaySystemSound(1306)
                    self.degrees += Double.random(in: 180..<1080)
                }
            }, label: {
                       bottle
                    })
            .animation(.linear(duration: 0))
            .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 0, z: 1))
        }
    }
}
