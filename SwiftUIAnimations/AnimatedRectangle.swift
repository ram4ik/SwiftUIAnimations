//
//  AnimatedRectangle.swift
//  SwiftUIAnimations
//
//  Created by Ramill Ibragimov on 06.02.2021.
//

import SwiftUI

private struct Modifications {
    let offset: CGFloat
    let color: Color
}

struct AnimatedRectangle: View {
    @State private var modificationIndex = 0
    @State private var modifications = [
        Modifications(offset: 0, color: .blue),
        Modifications(offset: 10, color: .gray),
        Modifications(offset: 20, color: .green),
        Modifications(offset: 30, color: .orange),
        Modifications(offset: 20, color: .pink),
        Modifications(offset: 10, color: .purple),
        Modifications(offset: 0, color: .red)
    ]
    
    var body: some View {
        Rectangle()
            .frame(width: 42, height: 42)
            .foregroundColor(modifications[modificationIndex].color)
            .offset(y: modifications[modificationIndex].offset)
            .onAppear() {
                for (index, _) in modifications.enumerated() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(index)) {
                        withAnimation(Animation.easeInOut) {
                            modificationIndex = index
                        }
                    }
                }
            }
    }
}

struct AnimatedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedRectangle()
    }
}
