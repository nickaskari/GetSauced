//
//  NeverHaveIEverView.swift
//  Quotes
//
//  Created by Nick Askari on 05/07/2021.
//

import SwiftUI

struct NeverHaveIEverView: View {
    
    let questions = FileManagment()
    
    init() {
        //questions.writeFile(writeString: "DSFjhvsf", to: "ape")
    }
    
    
    var body: some View {
        VStack {
            Text(questions.readFile(from: "ape"))
            
        }
    }
}

struct NeverHaveIEverView_Previews: PreviewProvider {
    static var previews: some View {
        NeverHaveIEverView()
    }
}
