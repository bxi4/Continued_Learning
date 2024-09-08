//
//  SoundBootCamp.swift
//  Continued Learning
//
//  Created by Muhammed Ahaj on 25/08/2024.
//

import SwiftUI
import AVKit

class SoundManger {
    static let instance = SoundManger()
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case Tada, Badum
    }
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing Sound \(error.localizedDescription)")
        }
    }
}

struct SoundBootCamp: View {
    
    var body: some View {
        VStack{
            Button("Sound 1") {
                SoundManger.instance.playSound(sound: .Tada)
            }
            Button("Sound 2") {
                SoundManger.instance.playSound(sound: .Badum)
            }
        }
            
    }
}

#Preview {
    SoundBootCamp()
}
