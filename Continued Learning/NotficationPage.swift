//
//  NotficationPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI
import UserNotifications

class NotificationManger {
    static let instance = NotificationManger()  // SingleTon
    
    // func request permisson
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { seccuss, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Seccess")
            }
            
        }
    }
    // SecheduleNotfiaction
    func SecheduleNotfiaction() {
        let content = UNMutableNotificationContent()
        content.title = "This is Title."
        content.subtitle = "This is SubTitle"
        content.sound = .default
        content.badge = 2
        
            // after 5 seccond Time.
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //On Calender
        var dateComponets = DateComponents()
        dateComponets.hour = 15
        dateComponets.minute = 10
        dateComponets.weekday = 1 // first day is sunday = 1
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponets, repeats: false)

        //On Location
//        let trigger = UNLocationNotificationTrigger()
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func removeNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}
struct NotficationPage: View {
    var vm = NotificationManger()
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Premisson") {
                NotificationManger.instance.requestAuthorization()
            }
            Button("Sechedule Notfiaction") {
                NotificationManger.instance.SecheduleNotfiaction()
            }
            Button("Cancel Notification") {
                NotificationManger.instance.removeNotification()
            }
        }
        .onAppear {
            
            // ios 17
        //UNUserNotificationCenter.setBadgeCount()

//            UIApplication.shared.applicationIconBadgeNumber = 0
            
        
        }
        
    }
}

#Preview {
    NotficationPage()
}
