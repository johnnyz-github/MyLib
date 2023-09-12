//
//  CircleProgressView.swift
//  DemoCircleAnimation
//
//  Created by Johnny Zhou on 24/8/2023.
//

import SwiftUI

// This will replace CircleProgressView in the main project
struct CircleProgressView: View {
    var strokeColor: Color
    var progress: CGFloat

    public init(strokeColor: Color = .blue, progress: CGFloat) {
        self.strokeColor = strokeColor
        self.progress = progress
    }

    public var body: some View {
        ZStack{

// Design don't like it, but i love it :)
//            Circle()
//                .trim(from: 0, to: 1)
//                .stroke(strokeColor.opacity(0.05), lineWidth: 6)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: 6, lineCap: .square))
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .frame(width: 36, height: 36)
        .rotationEffect(.init(degrees: -90))

    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CircleProgressView(strokeColor: .blue, progress: 0.1)
            CircleProgressView(strokeColor: .blue, progress: 0.2)
            CircleProgressView(strokeColor: .blue, progress: 0.5)
            CircleProgressView(strokeColor: .blue, progress: 1.0)
        }
    }
}
