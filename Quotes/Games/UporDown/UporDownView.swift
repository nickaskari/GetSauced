//
//  UporDownView.swift
//  Quotes
//
//  Created by Nick Askari on 03/07/2021.
//

import SwiftUI

struct UporDownView: View {
    @State private var y_position: CGFloat = 300
    private var uporDown = [CGFloat(0), CGFloat(650)]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(
                    destination: UporDownInformationView(),
                    label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.black)
                            .scaleEffect(1.4)
                            .padding()
                    })
            }
            .padding()
            
            Spacer()
            
            Circle()
                .position(x: 62, y: y_position)
                .aspectRatio(1/5, contentMode: .fit)
                .padding(.bottom, 90)
                .onTapGesture {
                    UtilityTools().getTapticFeedBack(style: .light)
                    withAnimation() {
                        withAnimation(Animation.linear(duration: 2)) {
                            self.y_position = 300
                        }
                        self.y_position = self.uporDown.randomElement()!
                        withAnimation(Animation.linear.delay(0.5)) {
                            self.y_position = 300
                        }
                    }
                }
    
            Spacer()
        }
        .background(Color.orange
                        .opacity(0.95)
                        .edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

struct UporDownView_Previews: PreviewProvider {
    static var previews: some View {
        UporDownView()
    }
}
