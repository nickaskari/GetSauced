//
//  LocalNotificationManager.swift
//  Quotes
//
//  Created by Nick Askari on 22/06/2021.
//

import UserNotifications

class LocalNotificationManager {
    private var notifications = [Notification] ()
    
    func addNotification(_ notification: Notification) {
        self.removeNotifications()
        self.notifications.append(notification)
        self.schedule()
    }
    
    func removeNotifications() {
        notifications.removeAll()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func listScheduledNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            for notification in notifications {
                print(notification)
            }
        }
    }
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted == true && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    private func schedule() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in

            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break
            }
        }
    }
    
    private func scheduleNotifications() {
        for notification in notifications {
            let content      = UNMutableNotificationContent()
            content.title    = "Chug Alarm🚨"
            content.subtitle = notification.subtitle
            content.sound    = UNNotificationSound(named: UNNotificationSoundName(rawValue: "ChugAlarm.mp3"))

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notification.timeInterval, repeats: true)

            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in

                guard error == nil else { return }

                print("Notification scheduled! --- ID = \(notification.id)")
            }
        }
    }
}

struct Notification {
    var id: String
    var subtitle: String
    var timeInterval: Double
}
