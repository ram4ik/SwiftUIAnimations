//
//  AnimatedImage.swift
//  SwiftUIAnimations
//
//  Created by Ramill Ibragimov on 06.02.2021.
//

import SwiftUI

struct AnimatedImage: View {
    @State private var zoomedIn = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Citroen")
                        .font(.title)
                        .foregroundColor(.primary)
                    Text("C4 2021")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .offset(x: zoomedIn ? 500 : 30, y: -30)
                .animation(.easeInOut)
                
                GeometryReader { geometry in
                    Image("c4")
                        .clipShape(
                            RoundedRectangle(cornerRadius: zoomedIn ? 40 : 500)
                        )
                        .overlay(
                            Circle()
                                .fill(zoomedIn ? Color.clear : Color(white: 1, opacity: 0.4))
                                .scaleEffect(0.8)
                        )
                        .saturation(zoomedIn ? 1 : 0.3)
                        .position(x: zoomedIn ? geometry.frame(in: .local).midX : 600, y: 50)
                        .scaleEffect((zoomedIn ? 1.4 : 1) / 3)
                        .shadow(radius: 10)
                        .animation(.spring())
                        .onTapGesture {
                            zoomedIn.toggle()
                        }
                }
            }.background(Color.primary.colorInvert())
        }
    }
}

struct AnimatedImage_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedImage()
    }
}
