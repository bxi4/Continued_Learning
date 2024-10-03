//
//  SoundPage.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI
import AVFoundation
struct SoundPage: View {
    
    let sounds: [Int] = [1000, 1001,1002,1003,1004, 1300, 1200 ,1500]
    var body: some View {
        ScrollView {
            ForEach(sounds, id: \.self) { count in
                Button("\(count)",systemImage: "speaker.wave.1.fill") {
                    AudioServicesPlaySystemSound(SystemSoundID(count))
                    
                }
                .withCustomButtonStyle()
            }
        }
    }
}
struct CustomButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
//            .font(.sy)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1)))
            .cornerRadius(10)
            .shadow(radius: 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
extension View{
    func withCustomButtonStyle() -> some View{
        buttonStyle(CustomButtonStyle())
    }
}

#Preview {
    SoundPage()
}
