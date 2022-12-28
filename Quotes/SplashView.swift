//
//  SplashView.swift
//  Quotes
//
//  Created by Nick Askari on 18/06/2021.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                GameView()
            } else {
                GeometryReader { geometry in
                    ZStack {
                        Color.orange
                            .opacity(1)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("GET\nFUCKING\nSAUCED🤌🏽")
                                .font(Font.largeTitle)
                                .frame(width: geometry.size.width)
                            Text("Created by Nick Askari")
                                .padding(20)
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeIn(duration: 0.2)) {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
