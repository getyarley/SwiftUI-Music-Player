//
//  SongPlayerView.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import SwiftUI

struct SongPlayerView: View {
    
    @ObservedObject var songStore: SongStore
    @Binding var isPlaying: Bool
    
    var musicPlayer = MusicPlayer()
    var isFavorite: Bool {
        if let playingSong = songStore.playingSong {
            return playingSong.favorite
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(formatSongName(songName: songStore.playingSong?.songName ?? "..."))
                    .foregroundColor(Color.yellowRed)
                    .fontWeight(.semibold)
                
                Spacer()
                Button(action: {self.songStore.favoriteToggle()}) {
                    if isFavorite {
                        Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.yellowRed)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.yellowRed)
                    }
                }
            } //END OF HSTACK
            
            ProgressBarView(songStore: self.songStore)
            
            HStack(alignment: .center) {
                Spacer()
                
                Button(action: {self.songStore.stop(); self.isPlaying = false}) {
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color.yellowRed)
                }
                
                if self.isPlaying {
                    Button(action: {self.songStore.pause(); self.isPlaying.toggle()}) {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.yellowRed)
                    }.padding(.horizontal, 30)
                } else {
                    Button(action: {self.songStore.playSong(); self.isPlaying.toggle()}) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.yellowRed)
                    }.padding(.horizontal, 30)
                }
                
                Button(action: {self.songStore.goForwardFifteen()}) {
                    Image(systemName: "goforward.15")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.yellowRed)
                }
                Spacer()
            } //END OF HSTACK
        } //END OF VSTACK
        .padding()
        .padding(.bottom, 40)
        .background(Color.charcoal)
    }
}

struct SongPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SongPlayerView(
            songStore: SongStore(),
            isPlaying: .constant(false)
        )
    }
}
