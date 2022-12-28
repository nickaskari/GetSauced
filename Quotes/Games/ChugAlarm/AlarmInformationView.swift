//
//  AlarmInformationView.swift
//  Quotes
//
//  Created by Nick Askari on 23/06/2021.
//

import SwiftUI

struct AlarmInformationView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.orange
                    .opacity(0.95)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Chill Mode")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text("The W's are caught in an interval of 40 minutes. Great for an after party.")
                        .padding(30)
                    Text("Third Gear")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text("A little heat for the dearing, with an interval of 20 minutes. Gear up!")
                        .padding(30)
                    Text("Blitz Annhiliation")
                        .font(.title)
                        .bold()
                    Text("If you choose this you are an idiot and an imbecile, with an interval of 5 minutes.")
                        .padding(30)
                }
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmInformationView()
    }
}
