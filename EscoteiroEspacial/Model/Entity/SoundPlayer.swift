//
//  SoundPlayer.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 29/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation
import AVFoundation

struct Sounds {
    
    var player = AVAudioPlayer()
    
    mutating func setupPlayer (nome:String, formato:String) -> AVAudioPlayer {
        let sound = Bundle.main.path(forResource: nome, ofType: formato)
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        return player
    }
    
    mutating func myAudio (_ astro: Astro) -> AVAudioPlayer {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        return setupPlayer(nome: astro.rawValue, formato: "wav")
    }
}
