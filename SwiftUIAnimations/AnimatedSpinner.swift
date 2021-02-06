//
//  AnimatedSpinner.swift
//  SwiftUIAnimations
//
//  Created by Ramill Ibragimov on 06.02.2021.
//

import SwiftUI

private struct Leaf: View {
    let rotation: Angle
    let isSelected: Bool
    
    var body: some View {
        Image(systemName: "leaf.fill")
            .resizable()
            .rotationEffect(Angle(degrees: 210))
            .foregroundColor(isSelected ? Color.green.opacity(0.8) : .green)
            .frame(width: 50, height: 50)
            .offset(isSelected ? .init(width: 10, height: 0) : .init(width: 40, height: 70))
            .scaleEffect(isSelected ? 0.5 : 1)
            .rotationEffect(rotation)
            .animation(.easeIn(duration: 1.5))
    }
}

struct AnimatedSpinner: View {
    
    let leavesCount = 12
    @State var currentIndex = -1
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<leavesCount) { index in
                    Leaf(
                        rotation: .init(degrees: .init(index) / .init(leavesCount) * 360),
                        isSelected: index == currentIndex
                    )
                }
            }.onAppear(perform: animate)
        }
    }
    
    private func animate() {
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            currentIndex = (currentIndex + 1) % leavesCount
        }
    }
}

struct AnimatedSpinner_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedSpinner()
    }
}
