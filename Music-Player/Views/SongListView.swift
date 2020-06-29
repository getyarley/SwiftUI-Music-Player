//
//  SongListView.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import SwiftUI

struct SongListView: View {
    
    @ObservedObject var songStore: SongStore
    @Binding var isPlaying: Bool
    @Binding var lockScrolling: Bool
    
    var musicPlayer = MusicPlayer()
    
    var body: some View {
        List(songStore.allSongs){ song in
            Button(action: {
                self.songStore.getMusic(song: song)
                self.songStore.stop()
                self.isPlaying = false}) {
                SongListRow(song: song)
            }
        } //END OF LIST
            .listRowBackground(Color.charcoal)
            .disabled(self.lockScrolling)
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(songStore: SongStore(), isPlaying: .constant(false), lockScrolling: .constant(false))
    }
}


func formatSongName(songName: String) -> String {
    var formattedName = songName
    formattedName = formattedName.replacingOccurrences(of: "-", with: " ")
    formattedName = formattedName.capitalized
    
    return formattedName
}
