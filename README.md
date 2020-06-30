# SwiftUI-Music-Player

> SwiftUI App that uses AVAudioPlayer to play and favorite songs. There are two player views with a side bar to navigate between them. The user has the ability to select a new song, play, pause, go forward/backward 15 seconds, and restart.

### Preview
![](https://github.com/getyarley/getyarley-images/blob/master/SwiftUI-Music-Player_ex.GIF?raw=true)


Welcome to my SwiftUI Music Player! This is an app I built to practice SwiftUI, combine (reactive programming), and AVAudioPlayer. The user can select songs preloaded into this app (not very useful for a released app) and play them with some basic controls such as play, pause, skip forward/backward 15 seconds, and restart. The user can also favorite songs and the view automatically updates to reflect the change. 

This can be used as a framework to build a more expansive media player app that either accesses the user's music library to play music or fetches music from online to load and play (or really whatever you want, don't let me hold you back!).


## Setup

Add desired songs into [Music-Player](https://github.com/getyarley/SwiftUI-Music-Player/tree/Music-Player/Music-Player) folder inside X-Code, make sure to use mp3 format. 

If the songs are not mp3 format, update the initializer in the [Song](https://github.com/getyarley/SwiftUI-Music-Player/blob/Music-Player/Music-Player/Types/Song.swift) type to include the correct file extension:
```sh
    init(id: UUID, songName: String, favorite: Bool) {
        ...
        self.fileType = "mp3"
    }
```

Update song names in [SongStore](https://github.com/getyarley/SwiftUI-Music-Player/blob/Music-Player/Music-Player/Models/SongStore.swift) initializer to match the titles of the songs (SONG-TITLE-HERE) added EXACTLY! If the song title's and/or filetype don't match, the music won't be loaded properly.
```sh
    init() {
        allSongs.append(Song(id: UUID(), songName: "SONG-TITLE-HERE", favorite: false))
        ...
    }
```


_DISCLAIMER: This app is currently build to handle songs manually included with the project only and hard coded to the store. More work will need to be done to expand it more than that._




