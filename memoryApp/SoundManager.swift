//
//  SoundManager.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 16/04/2023.
//

import Foundation
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum Sounds: String {
        case flip = "switch"
        case match = "mario"
        case mismatch = "wrong"
        case win = "win"
    }
    
    func playSound(_ sound: Sounds){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}
