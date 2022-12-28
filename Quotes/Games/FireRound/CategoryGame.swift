//
//  CategoryGame.swift
//  Quotes
//
//  Created by Nick Askari on 29/06/2021.
//

import Foundation
import AVFoundation

struct CategoryGame {
    private var categories: Array<String>
    private var timeCap: Int
    private var audioPlayer: AVAudioPlayer!
    private(set) var alarm: Alarm
    private(set) var timer: gameTimer
    private(set) var randomCategory: String
    private(set) var displayText: String
    private(set) var isVisible: Bool
    
    init(categories: Array<String>, alarm: Alarm) {
        self.categories = categories
        self.alarm = alarm
        self.timer = gameTimer()
        self.randomCategory = self.categories.randomElement()!
        self.displayText = "START"
        self.isVisible = true
        self.timeCap = 0
    }
    
    mutating func updateRandomCategory() {
        self.randomCategory = self.categories.randomElement()!
        UtilityTools().getTapticFeedBack(style: .light)
    }
    
    mutating func start() {
        if !timer.isTimeRunnning {
            timer.isTimeRunnning = true
            
            
        }
    } 
    
    mutating func initiateCountDown() {
        if timer.timeRemaining >= 0 && timer.isTimeRunnning {
            self.displayText = "\(timer.timeRemaining)"
            UtilityTools().getTapticFeedBack(style: .heavy)
            timer.decrementTimeRemaining()
        }
        if timer.timeRemaining == -1 {
            self.isVisible = false
        }
    }
    
    mutating func initiateComingAlarm() {
        timer.incrementTimeRemaining()
        if timer.timeRemaining == alarm.trigger {
            alarm.showAlarm = true
            self.timeCap = (2 + timer.timeRemaining)
        }
    }
    
    mutating func stopAlarm() {
        if timer.timeRemaining > timeCap {
            self.audioPlayer.stop()
            alarm.showAlarm = false
            timer.timeRemaining = 0
            alarm.updateTrigger()
            self.updateRandomCategory()
        }
    }
    
    mutating func atAlarm() {
        timer.incrementTimeRemaining()
    }
    
    struct gameTimer {
        var isTimeRunnning: Bool = false
        var timeRemaining: Int = 3
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        
        mutating func incrementTimeRemaining() {
            self.timeRemaining += 1
        }
        
        mutating func decrementTimeRemaining() {
            self.timeRemaining -= 1
        }
    }
    
    mutating func playSounds(_ soundFileName : String) {
             guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
                 fatalError("Unable to find \(soundFileName) in bundle")
             }

             do {
                 audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
             } catch {
                 print(error.localizedDescription)
             }
             audioPlayer.play()
         }
}

struct Alarm {
    var showAlarm: Bool
    private(set) var trigger: Int
    private let from: Int
    private let to: Int
    
    init(from: Int, to: Int) {
        self.from = from
        self.to = to
        self.trigger = Int.random(in: from..<to)
        self.showAlarm = false
    }
    
    mutating func updateTrigger() {
        self.trigger = Int.random(in: from..<to)
    }
}
