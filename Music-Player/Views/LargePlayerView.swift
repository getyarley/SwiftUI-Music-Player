//
//  LargePlayerView.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import SwiftUI

struct LargePlayerView: View {
    
    @ObservedObject var songStore: SongStore
    @Binding var isPlaying: Bool
    
    var isFavorite: Bool {
        if let playingSong = songStore.playingSong {
            return playingSong.favorite
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            Color.charcoal
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                
                Group{
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 75, height: 100)
                        .foregroundColor(.silver)
                        .padding(60)
                } //END OF GROUP
                    .background(Color.black)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .padding(.bottom)
                
                HStack {
                    Spacer()
                    ProgressBarView(songStore: self.songStore)
                    Spacer()
                } //END OF HSTACK
                
                Text(formatSongName(songName: self.songStore.playingSong?.songName ?? "..."))
                    .foregroundColor(Color.yellowRed)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                
                HStack(alignment: .center) {
                    Button(action: {self.songStore.stop(); self.isPlaying = false}) {
                        Image(systemName: "backward.end.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.yellowRed)
                    }
                    .padding(.horizontal, 20)

                    Button(action: {self.songStore.goBackFifteen()}) {
                        Image(systemName: "gobackward.15")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.yellowRed)
                    }
                    
                    if self.isPlaying {
                        Button(action: {self.songStore.pause(); self.isPlaying = false}) {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.yellowRed)
                                .padding(.horizontal, 15)
                        }
                    } else {
                        Button(action: {self.songStore.playSong(); self.isPlaying = true}) {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.yellowRed)
                                .padding(.horizontal, 15)
                        }
                    }
                    
                    Button(action: {self.songStore.goForwardFifteen()}) {
                        Image(systemName: "goforward.15")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.yellowRed)
                    }
                    
                    Button(action: {self.songStore.favoriteToggle()}) {
                        if isFavorite {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.yellowRed)
                                .padding(.horizontal, 20)
                        } else {
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.yellowRed)
                                .padding(.horizontal, 20)
                        }
                    }
                } //END OF HSTACK
                    .padding(.horizontal)
                
            } //END OF VSTACK
        } //END OF ZSTACK
    }
}

struct LargePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        LargePlayerView(songStore: SongStore(), isPlaying: .constant(false))
    }
}
