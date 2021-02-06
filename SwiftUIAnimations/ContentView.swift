//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Ramill Ibragimov on 06.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimatedRectangle()
                .tabItem { Image(systemName: "1.circle") }
            
            AnimatedImage()
                .tabItem { Image(systemName: "2.circle") }
            
            AnimatedSpinner()
                .tabItem { Image(systemName: "3.circle") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
