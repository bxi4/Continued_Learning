//
//  NotifiactionCenter.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 26/08/2024.
//

import SwiftUI
import UserNotifications

class NotficationViewModel {
    static var instance = NotficationViewModel()
    
    func requestPremisson() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { seccess, error in
            if let error = error {
                print("error request premisson \(error)")
                
            }else {
                print("Seccuss")
            }
        }
    }
    func requestNotification(title: String, subTitle: String, date: Date) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.sound = .default
        content.badge = 1
        
        
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
//        var dateNotification = DateComponents()
//        dateNotification.hour = 9
//        dateNotification.minute = 56
//        dateNotification.
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
    }
    func removeNotifaction() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}


struct NotifiactionCenter: View {
    @State var selectDate = Date()
    
    var body: some View {
        VStack {
            Button("Premission Notification"){
                NotficationViewModel().requestPremisson()
            }.withCustomButtonStyle()
            Button("Request Notification"){
                NotficationViewModel().requestNotification(title: "From String Title", subTitle: "From String SubTitle.", date: selectDate)
            }.withCustomButtonStyle()
            
            DatePicker("Date Picker Select", selection: $selectDate)
                .padding()
            
            
            Button("Remove Notification") {
                NotficationViewModel().removeNotifaction()
            }
        }
    }
}

#Preview {
    NotifiactionCenter()
}
