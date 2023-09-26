//
//  StretchyHeaderTop.swift
//  NandosHomeScreen
//
//  Created by Rajat Jangra on 26/09/23.
//

import SwiftUI

struct StretchyHeaderTop<Content: View, Space: Hashable>: View {
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

            let offset = offset(for: frame)
            let heightAdjustment = max(0, frame.minY)
            
            content()
                .frame(width: proxy.size.width, height: proxy.size.height + heightAdjustment)
                .offset(y: offset)
        }.frame(height: height)
    }
    
    private func offset(for frame: CGRect) -> CGFloat {
        if frame.minY < 0 {
            return -frame.minY * 0.8
        }
        return -frame.minY
    }
}
