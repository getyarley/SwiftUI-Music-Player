//
//  Song.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import Foundation

struct Song: Identifiable {
    
    var id: UUID
    var songName: String
    var favorite: Bool
    var fileType: String
    
    
    init(id: UUID, songName: String, favorite: Bool) {
        self.id = id
        self.songName = songName
        self.favorite = favorite
        self.fileType = "mp3"
    }
    
}
