//
//  MainViewModel.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/25/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import Foundation
import AVFoundation

class MusicPlayer {
    
    var audioPlayer: AVAudioPlayer?
    
    func getMusic(song: Song) {
        guard let filePath = Bundle.main.path(forResource: song.songName, ofType: song.fileType) else {
            print("File path doesn't exist")
            return
        }
        let url = URL(fileURLWithPath: filePath)
        do {
            print(url)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            print("Prep complete")
            audioPlayer?.play()
            print("Play started")
        } catch {
            print(error)
        }
        
    }
    
    func stop() {
        audioPlayer?.stop()
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func pause() {
        audioPlayer?.pause()
    }
}

