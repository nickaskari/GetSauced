//
//  UporDownInformationView.swift
//  Quotes
//
//  Created by Nick Askari on 03/07/2021.
//

import SwiftUI

struct UporDownInformationView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.orange
                    .opacity(0.95)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Actually too easy 💪🏽")
                        .font(.largeTitle)
                        .bold()
                    
                        .padding(.bottom, 40)
                        .padding(.top, 65)
                    InstructionText("Press the circle")
                    InstructionText("Guess up, or down")
                    InstructionText("Guesed wrong? Drink champ")
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

struct UporDownInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UporDownInformationView()
    }
}
