//
//  CircleProgressView.swift
//  TravelAssist
//
//  Created by liang.wang on 8/7/2022.
//  Copyright © 2022 CoverMore. All rights reserved.
//

import SwiftUI

struct CircleProgressView: View {
    var progress: Float
    var foregroundColor: Color

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
//                .stroke(lineWidth: 18.0)
//                .foregroundColor(Color.white)
            Circle()
                .stroke(lineWidth: 18.0)
                .foregroundColor(Color.white)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 18.0, lineCap: .butt, lineJoin: .round))
                .foregroundColor(foregroundColor)
                .rotationEffect(Angle(degrees: 270.0))
        }
        .overlay(
            Image("circleShadow").resizable().padding(-18.0 / 2)
        )
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    @State private static var progress: Float = 0.5
    static var previews: some View {
        ScrollView {
            VStack {
                CircleProgressView(progress: 0.0, foregroundColor: .green)
                CircleProgressView(progress: 0.25, foregroundColor: .pink)
                CircleProgressView(progress: 0.5, foregroundColor: .yellow)
                CircleProgressView(progress: 0.75, foregroundColor: .purple)
                CircleProgressView(progress: 1, foregroundColor: .red)
            }
        }
    }
}
