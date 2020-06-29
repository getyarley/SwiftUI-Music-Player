//
//  ProgressBarView.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import Foundation
import AVFoundation
import SwiftUI

struct ProgressBarView: View {
    
    @ObservedObject var songStore: SongStore
    
    //GEOMETRY VARS
    let widthRatio: CGFloat = 0.8
    let heightValue: CGFloat = 3
    
    //TIMER VARS
    @State var currentTime: TimeInterval?
    var duration: TimeInterval? {
        if songStore.playingSong != nil {
            return songStore.audioPlayer.duration
        } else {
            return 0
        }
    }
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color.black
                    .mask(Capsule())
                    .frame(width: geometry.size.width * self.widthRatio, height: self.heightValue)
                
                HStack {
                Color.silver
                    .mask(Capsule())
                    .frame(width: self.calculatePercent(totalTime: self.songStore.duration, currentTime: self.currentTime ?? 0, geometryWidth: (geometry.size.width * self.widthRatio)), height: self.heightValue)
                }
            } //END OF ZSTACK
        } //END OF GEOMETRYREADER
            .fixedSize(horizontal: false, vertical: true)
            
            .onReceive(timer) { _ in
                if self.songStore.isPlaying {
                    let currentTimePlayer = self.songStore.audioPlayer.currentTime
                    self.currentTime = currentTimePlayer
                    
                    if self.songStore.isPlaying == false {
                        self.currentTime = TimeInterval(0.0)
                    }
                }
            }
    } //END OF BODY
    
    func calculatePercent(totalTime: TimeInterval, currentTime: TimeInterval, geometryWidth: CGFloat) -> CGFloat {
        if totalTime == 0 {
            return 0
        }

        let percentDouble = Double(currentTime) / Double(totalTime)
        let percentFull = CGFloat(percentDouble)
        let finalWidth =  geometryWidth * percentFull
        return finalWidth
    } //END OF FUNC
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(songStore: SongStore())
    }
}
