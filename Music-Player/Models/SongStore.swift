//
//  SongStore.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

final class SongStore: ObservableObject {
    
    @Published var allSongs = [Song]()
    @Published var playingSong: Song?
    @Published var isPlaying: Bool = false
    @Published var duration: TimeInterval = 0
    @Published var currentTime: TimeInterval = 0
    
    var audioPlayer = AVAudioPlayer()
    
    
    init() {
        allSongs.append(Song(id: UUID(), songName: "blood-sport", favorite: false))
        allSongs.append(Song(id: UUID(), songName: "corinthian-order", favorite: false))
        allSongs.append(Song(id: UUID(), songName: "give-yourself-into-love", favorite: true))
        allSongs.append(Song(id: UUID(), songName: "pet-sematary", favorite: false))
        allSongs.append(Song(id: UUID(), songName: "the-selfish-bell", favorite: false))
        getMusic(song: allSongs[0])
    }
    
    
    func getMusic(song: Song) {
        let songName = song.songName
        self.playingSong = song
        guard let filePath = Bundle.main.path(forResource: songName, ofType: song.fileType) else {
            print("Song doesn't exist")
            return
        }
        let url = URL(fileURLWithPath: filePath)
                
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch {
            print("ERROR: \(error)")
        }
    } //END OF FUNC
    
    func playSong() {
        self.audioPlayer.play()
        self.duration = audioPlayer.duration
        self.currentTime = audioPlayer.currentTime
        self.isPlaying = true
    } //END OF FUNC

    func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        self.isPlaying = false
    } //END OF FUNC

    func pause() {
        audioPlayer.pause()
        self.isPlaying = false
    } //END OF FUNC
    
    func favoriteToggle() {
        guard let playingSong = self.playingSong else {return}
        self.playingSong?.favorite.toggle()

        let songID = playingSong.id
        guard let index = allSongs.firstIndex(where: {$0.id == songID}) else {
            print("No song match")
            return
        }
        var foundSong = allSongs[index]
        foundSong.favorite.toggle()
        allSongs[index] = foundSong
    }
    
    func goForwardFifteen() {
        audioPlayer.currentTime += 15
    }
    
    func goBackFifteen() {
        if audioPlayer.currentTime < 15 {
            audioPlayer.currentTime = 0
        } else {
            audioPlayer.currentTime -= 15
        }
    }
    
}

