//
//  VirbationPAge.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI
class HapticManger {
    static let instance = HapticManger() // singleTon
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
struct VirbationPage: View {
    var body: some View {
        Button("success"){HapticManger.instance.notification(type: .success)}
        Button("warning"){HapticManger.instance.notification(type: .warning)}
        Button("error"){HapticManger.instance.notification(type: .error)}

        Divider()
        Button("medium"){HapticManger.instance.impact(style: .medium)}
        Button("heavy"){HapticManger.instance.impact(style: .heavy)}
        Button("light"){HapticManger.instance.impact(style: .light)}
        Button("soft"){HapticManger.instance.impact(style: .soft)}
        
        //test Notifcation Here !.

        Button("Notifcation"){
//            NotficationViewModel().requestNotification(title: "Mohammed", subTitle: "Ahmed Alwrafi")
        }
    }
}

#Preview {
    VirbationPage()
}
