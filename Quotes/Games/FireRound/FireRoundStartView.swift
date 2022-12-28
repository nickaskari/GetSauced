//
//  FireRoundStartView.swift
//  Quotes
//
//  Created by Nick Askari on 26/06/2021.
//

import SwiftUI

struct FireRoundStartView: View {
    @StateObject private var game = FireRoundGame()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(
                    destination: FireRoundInformationView(),
                    label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.black)
                            .scaleEffect(1.4)
                            .padding()
                    })
            }
            .padding()
            
            Spacer()
            
            if game.isVisible {
                Button(action: {
                    game.start()
                }, label: {
                    Text("\(game.displayText)")
                        .padding()
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black)
                                .opacity(0.75)
                            )
                        .onReceive(game.timer) { time in
                            game.initiateCountDown()
                        }
                })
                .animation(.linear(duration: 0.2))
                .padding(.bottom, 90)
            }
            
            if !game.isVisible && !game.showAlarm {
                Button(action: {
                    game.updateRandomCategory()
                }, label: {
                    Text("\(game.randomCategory)")
                        .padding(30)
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .fill(Color.black)
                                .opacity(0.75)
                            )
                        .onReceive(game.timer) { time in
                            game.initiateComingAlarm()
                        }
                })
                .animation(.linear(duration: 0.2))
                .padding(.bottom, 90)
                .padding(.horizontal)
            }
            
            if game.showAlarm {
                Button(action: {
                    game.stopAlarm()
                }, label: {
                    Text("🚨")
                        .font(.system(size: 200))
                        .padding(.bottom, 90)
                })
                .onAppear {
                    game.playSounds("ChugAlarm.mp3")
                }
                .onReceive(game.timer) { time in
                    game.atAlarm()
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














struct GoCrazyGoStupidStartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FireRoundStartView()
            FireRoundStartView()
                .preferredColorScheme(.dark)
        }
    }
}
