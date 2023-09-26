//
//  StretchyHeaderBottom.swift
//  NandosHomeScreen
//
//  Created by Rajat Jangra on 26/09/23.
//

import SwiftUI

struct StretchyHeaderBottom<Content: View, Space: Hashable>: View {
    let content: () -> Content
    let coordinateSpace: Space
    let height: CGFloat
    
    init(coordinateSpace: Space, height: CGFloat, @ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
        self.coordinateSpace = coordinateSpace
        self.height = height
    }
    
    var body: some View {
        GeometryReader { proxy in
            let frame = proxy.frame(in: .named(coordinateSpace))
            let heightAdjustment = (height - frame.minY)
            let offset = offset(for: frame)
            
            content()
                .edgesIgnoringSafeArea(.horizontal)
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height + heightAdjustment
                )
                .offset(y: offset)
            
        }.frame(height: height)
    }
    
    private func offset(for frame: CGRect) -> CGFloat {
        if frame.minY <= height {
            return 20
        }
        return frame.minY - height
    }
}
