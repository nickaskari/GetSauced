//
//  QuotesApp.swift
//  Quotes
//
//  Created by Nick Askari on 11/06/2021.
//

import SwiftUI

@main
struct QuotesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
    
}


