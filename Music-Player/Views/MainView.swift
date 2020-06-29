//
//  ContentView.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/25/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    @EnvironmentObject var songStore: SongStore
    @State var isPlaying = false
    @State var showSideBar = false
    @State var showPlayer = false
    
    init() {
        let view = UIView()
        view.backgroundColor = UIColor.charcoal
        UITableView.appearance().tableFooterView = view
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        UITableView.appearance().backgroundColor = UIColor.charcoal
        UITableViewCell.appearance().backgroundColor = UIColor.charcoal
    }
    
    var body: some View {
            ZStack {
                Color.charcoal
                    .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in

                    VStack(alignment: .leading) {
                        Button(action: { withAnimation{
                            self.showSideBar.toggle()
                        } }) {
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.yellowRed)
                        }
                        .padding(.top)
                        .padding(.leading)
                        
                        ZStack {
                            VStack {
                                HStack {
                                    Text("Your Music")
                                        .foregroundColor(Color.yellowRed)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top)
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                
                                SongListView(songStore: self.songStore, isPlaying: self.$isPlaying, lockScrolling: self.$showSideBar)
                                    .foregroundColor(Color.yellowRed)
                                Spacer()
                                
                                SongPlayerView(songStore: self.songStore, isPlaying: self.$isPlaying)
                            } //END OF GROUP
                                .offset(x: self.showPlayer ? -geometry.size.width : 0)
                                                    
                            LargePlayerView(songStore: self.songStore, isPlaying: self.$isPlaying)
                                .offset(x: self.showPlayer ? 0 : geometry.size.width)
                        }

                    } //END OF VSTACK
                        .edgesIgnoringSafeArea(.bottom)
                    
                    MenuSideView(showSideBar: self.$showSideBar, showPlayer: self.$showPlayer)
                        .offset(x: self.showSideBar ? 0 : -geometry.size.width)
                } //END OF GEOMETRYREADER
            } //END OF ZSTACK

    } //END OF BODY
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
