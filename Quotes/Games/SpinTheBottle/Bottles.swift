//
//  Bottle.swift
//  Quotes
//
//  Created by Nick Askari on 18/06/2021.
//
import Foundation

struct Bottles {
    
    private(set) var bottles: [String: Double]
    
    init(_ newBottles: Dictionary<String, Double>) {
        bottles = [:]
        newBottles.forEach {
            (String, Double) in bottles[String] = Double
        }
    }
    
    func getBottleNames() -> Dictionary<String, Double>.Keys  {
        return bottles.keys
    }
}

