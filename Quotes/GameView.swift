//
//  ContentView.swift
//  Quotes
//
//  Created by Nick Askari on 11/06/2021.
//

import SwiftUI
import UserNotifications

struct GameView: View {
    @ObservedObject var premium = PremiumBottles()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 127))]) {
                        NavigationLink(
                            destination: SpinTheBottleMenuView()) {
                            MenuItemView(title: "Spin the Bottle🍾")
                        }
                        NavigationLink(
                            destination: FireRoundStartView()) {
                            MenuItemView(title: "Fire\nRound🔥")
                        }
                        NavigationLink(
                            destination: AlarmView()) {
                            MenuItemView(title: "Chug\nAlarm🚨")
                        }
                        NavigationLink(
                            destination: UporDownView()) {
                            MenuItemView(title: "Up or\nDown↕️")
                        }
                        /*NavigationLink(
                            destination: NeverHaveIEverView()) {
                            MenuItemView(title: "Never Have I Ever")
                        }*/
                    }
                    .padding()
                }
                .navigationTitle("Get Sauced🤌🏽")
                Text("Drink Responsibly...")
                    .font(.footnote)
            }
        }
        .accentColor(.black)
        .preferredColorScheme(.light)
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 11")
            GameView()
        }
    }
}
