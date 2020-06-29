//
//  MenuSideView.swift
//  Music-Player
//
//  Created by Jeremy Yarley on 6/27/20.
//  Copyright © 2020 Jeremy Yarley. All rights reserved.
//

import SwiftUI

struct MenuSideView: View {
    
    @Binding var showSideBar: Bool
    @Binding var showPlayer: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Spacer()
                        Button(action: { withAnimation {
                            self.showSideBar.toggle()
                        }}) {
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.charcoal)
                        }
                        .padding(.trailing)
                    } //END OF HSTACK
                        .padding(.top, 100)
                    
                    HStack {
                        Text("Menu")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.charcoal)
                            .lineLimit(0)
                        Spacer()
                    }.padding(.leading)
                    
                    Button(action: { withAnimation {
                        self.showPlayer = false
                        }}) {
                        Text("All Songs")
                            .fontWeight(.semibold)
                            .foregroundColor(.charcoal)
                    }.padding(.leading)

                    Button(action: { withAnimation {
                        self.showPlayer = true
                        }}) {
                        Text("Player")
                            .fontWeight(.semibold)
                            .foregroundColor(.charcoal)
                    }.padding(.leading)
                    Spacer()
                    
                } //END OF VSTACK
                .frame(width: geometry.size.width * 0.5, height: geometry.size.height + 100, alignment: .center)
                .background(Color.yellowRed)

                Button(action: { withAnimation {
                    self.showSideBar.toggle()
                    }
                    }) {
                    Text("")
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height + 100, alignment: .center)
                }
            }//END OF VSTACK
    } //END OF GEOMETRYREADER
    }
}

struct MenuSideView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSideView(showSideBar: .constant(true), showPlayer: .constant(false))
    }
}
