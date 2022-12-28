//
//  SaucyQuestions.swift
//  Quotes
//
//  Created by Nick Askari on 05/07/2021.
//

import Foundation

class SaucyQuestions: ObservableObject {
    
    static func createBottles() -> FileHandler {
        FileHandler(fileName: "Ape")
    }
    
    @Published private var model: FileHandler = createBottles()
    
    var questions: Array<String> {
        model.read()
    }
}

