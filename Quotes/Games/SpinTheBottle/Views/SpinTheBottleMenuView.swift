//
//  SpinTheBottleMenuView.swift
//  Quotes
//
//  Created by Nick Askari on 18/06/2021.
//

import SwiftUI

struct SpinTheBottleMenuView: View {
    @ObservedObject var premium = PremiumBottles()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange
                    .opacity(0.95)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ForEach(premium.bottleNames.sorted(), id: \.self) { bottle in
                        NavigationLink(
                            destination: SpinTheBottleView(BottleView(bottle)),
                            label: {
                                Text("\(bottle)")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .padding()
                            })
                    }
                }
                .navigationTitle("Choose your 🍾")
            }
        }
        .navigationBarHidden(true)
    }
}







struct SpinTheBottleMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SpinTheBottleMenuView()
    }
}
