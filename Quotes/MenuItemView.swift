//
//  MenuItemView.swift
//  Quotes
//
//  Created by Nick Askari on 13/06/2021.
//

import SwiftUI

struct MenuItemView: View {
    var title:String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.orange, lineWidth: 5)
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.orange).opacity(0.8)
                Text("\(title)")
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding(20)
                    .frame(width: geometry.size.width)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}




