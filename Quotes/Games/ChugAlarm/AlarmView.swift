//
//  AlarmView.swift
//  Quotes
//
//  Created by Nick Askari on 19/06/2021.
//

import SwiftUI

struct AlarmView: View {
    @State var manager = LocalNotificationManager()
    
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(
                        destination: AlarmInformationView(),
                        label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(.black)
                                .scaleEffect(1.4)
                                .padding()
                        })
                }
                .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        Menu("Initate Alarm 🚨") {
                            Button(action: {
                                manager.addNotification(Notification(id: "reminder:blitz", subtitle: "Chug, you stupid motherfu..!", timeInterval: 300))
                                UtilityTools().getTapticFeedBack(style: .heavy)
                            }, label: {
                                Text("Blitz Annihliation")
                            })
                            
                            Button(action: {
                                manager.addNotification( Notification(id: "reminder:thirdgear", subtitle: "Gear up big lads!", timeInterval: 1200))
                                UtilityTools().getTapticFeedBack(style: .light)
                            }, label: {
                                Text("Third Gear")
                            })
                            
                            Button(action: {
                                manager.addNotification(Notification(id: "reminder:chill", subtitle: "Get this W", timeInterval: 2400))
                                UtilityTools().getTapticFeedBack(style: .light)
                            }, label: {
                                Text("Chill mode")
                            })
                            .padding()
                        }
                        .menuStyle(SphereMenuStyle())
                    }
                    
                    HStack {
                        Button(action: {
                            manager.removeNotifications()
                            UtilityTools().getTapticFeedBack(style: .soft)
                        }, label: {
                            Text("Reset Alarm")
                                .foregroundColor(.white)
                                .font(.title)
                                .shadow(radius: 10)
                                .padding(10)
                        })
                        .padding()
                    }
                    .padding(.bottom, 60)
                }
                
                Spacer()
            }
            .background(Color.orange
                            .opacity(0.95)
                            .edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
    }
}

struct SphereMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .foregroundColor(.white)
            .font(.largeTitle)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(20)
            .background(
                Capsule()
                    .fill(Color.black)
                    .opacity(0.75)
            )
    }
}





















struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AlarmView()
            AlarmView()
                .preferredColorScheme(.dark)
        }
    }
}
