//
//  SongListRow.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import SwiftUI

struct SongListRow: View {
    
    var song: Song
    
    var body: some View {
        HStack {
            Text(formatSongName(songName: song.songName))
            
            Spacer()
            
            if song.favorite {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellowRed)
            } else {
                Image(systemName: "star")
                    .foregroundColor(Color.yellowRed)
            }
        } //END OF HSTACK
            .padding(.vertical)
    }
}

struct SongListRow_Previews: PreviewProvider {
    static var previews: some View {
        SongListRow(song: Song(id: UUID(), songName: "Song", favorite: false))
    }
}
