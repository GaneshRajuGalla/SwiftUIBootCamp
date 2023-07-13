//
//  SoundManager.swift
//  SoundEffects
//
//  Created by Ganesh on 13/07/23.
//

import Foundation
import AVKit

class SoundManager{
    static let instance = SoundManager()
    
    var player:AVAudioPlayer?
    
    func playSound(sound:SoundOptions){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error: \(error.localizedDescription)")
        }
        
    }
}

enum SoundOptions:String,CaseIterable{
    case ship
    case duck
    case heart
    case cow
}
