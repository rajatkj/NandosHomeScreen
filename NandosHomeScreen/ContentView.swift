//
//  ContentView.swift
//  NandosHomeScreen
//
//  Created by Rajat Jangra on 27/08/23.
//

import SwiftUI

struct ContentView: View {
    private enum CoordinateSpaces {
        case scrollview
    }
    
    var body: some View {
        ScrollView {
            StretchyHeaderTop(coordinateSpace: CoordinateSpaces.scrollview, height: 420) {
                Image("cat2")
                    .resizable()
                    .scaledToFill()
            }
            StretchyHeaderBottom(coordinateSpace: CoordinateSpaces.scrollview, height: 420) {
                Image("cat4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
            Image("banner")
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 250)
                .clipped()
                .rotationEffect(.degrees(-10))
                .offset(y: -UIScreen.main.bounds.height/1.7)
        }
        .coordinateSpace(name: CoordinateSpaces.scrollview)
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
