//
//  FireRoundInformationView.swift
//  Quotes
//
//  Created by Nick Askari on 28/06/2021.
//

import SwiftUI

struct FireRoundInformationView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.orange
                    .opacity(0.95)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("It's Easy 💪🏽")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 40)
                        .padding(.top, 65)
                    InstructionText("Answer to the given category")
                    InstructionText("Tap the screen for the next player")
                    InstructionText("Alarm -> Player has to chug")
                }
            }
        }
    }
    
    private func InstructionText(_ text: String) -> some View {
        let instuction = Text(text)
                            .padding(10)
        return instuction
    }
}













struct FireRoundInformationView_Previews: PreviewProvider {
    static var previews: some View {
        FireRoundInformationView()
    }
}
