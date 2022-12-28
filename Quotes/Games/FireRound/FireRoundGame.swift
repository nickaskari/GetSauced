//
//  FireRoundGame.swift
//  Quotes
//
//  Created by Nick Askari on 29/06/2021.
//

import SwiftUI
import Foundation
import Combine

class FireRoundGame: ObservableObject {
    
    static let categories = ["Female Pornstars", "Capitals", "Beer Brands", "Football Players", "Car Brands", "Anime", "Nobel Prize Winners", "Christopher Nolan Movies", "Basketball Players", "Planets", "Male Pornstars", "Shoe Brands", "Locations For a Date", "French Cities", "Tinder Pickuplines", "Whisky Brands", "Chest Exercises", "Kinky Shit", "Rappers", "Quentin Tarantino Movies", "Countries", "African Cities", "Leg Exercises", "Cocktails", "Pastime Activities", "Insults", "Best Compliments", "Wine Types", "Awkward Situations", "Jewish Holidays", "Grindr Pickuplines", "Drunk Foods", "Things to Spend Money on", "Watch Brands", "Actors", "Podcast Ideas", "American Companies", "Songs", "Luxury Clothing Brands", "Rock Bands", "Soda Brands", "Norwegian Artists", "Sex Positions", "NBA teams", "Premier League Teams", "MLB teams", "NHL teams", "Champion Leauge winners", "Gourmet Foods", "Perfume Brands", "American Cities", "Countries Starting with B", "Eurovision Winners", "Best Gifts", "What NOT to say under Sex", "What to Say Under Sex"]
    
    static func createCategories() -> CategoryGame {
        CategoryGame(categories: categories, alarm: Alarm(from: 4, to: 30))
    }
    
    @Published private var model: CategoryGame = createCategories()
    
    var isTimeRunning: Bool {
        model.timer.isTimeRunnning
    }
    
    var showAlarm: Bool {
        model.alarm.showAlarm
    }
    
    var randomCategory: String {
        model.randomCategory
    }
    
    var displayText: String {
        model.displayText
    }
    
    var isVisible: Bool {
        model.isVisible
    }
    
    var timer: Publishers.Autoconnect<Timer.TimerPublisher> {
        model.timer.timer
    }
    
    func updateRandomCategory() {
        model.updateRandomCategory()
    }
    
    func start() {
        model.start()
    }
    
    func initiateCountDown() {
        model.initiateCountDown()
    }
    
    func initiateComingAlarm() {
        model.initiateComingAlarm()
    }
    
    func stopAlarm() {
        model.stopAlarm()
    }
    
    func atAlarm() {
        model.atAlarm()
    }
    
    func playSounds(_ soundFileName : String) {
        model.playSounds(soundFileName)
    }
}

