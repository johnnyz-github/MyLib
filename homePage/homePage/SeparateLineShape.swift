//
//  SeparateLineShape.swift
//  homePage
//
//  Created by Johnny1 on 27/2/2023.
//

import Foundation
import SwiftUI

struct SeparateLineShape: Shape {
   

    func path(in rect: CGRect) -> Path {
        var path = Path()
        var x1 = rect.minX
        var y1 = rect.minY
        var x2 = rect.maxX
        var y2 = rect.maxY
        var r = y2 - y1
        print("\(x1), \(y1), \(x2), \(y2), \(r)")
        let p1 = CGPoint(x: x1, y: y2)
        let p2 = CGPoint(x: (x2 - x1) / 2 - r , y : y2)
        let p3 = CGPoint(x: (x2 - x1) / 2 + r, y: y2 )
        let p4 = CGPoint(x: x2, y: y2)
        let po = CGPoint(x: (x2 - x1 ) / 2, y: y2)

        let p5 = CGPoint(x: x2, y: y2 + 5)
        let p6 = CGPoint(x: x1, y: y2 + 5)
        path.move(to: p1)
        path.addLine(to: p4)
        path.addRelativeArc(center: po, radius: r,
                            startAngle: Angle.degrees(180), delta: Angle.degrees(180))
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.addLine(to: p6)
        path.addLine(to: p1)
        return path
    }
}

struct SeparateLineShape_Previews: PreviewProvider {
    static var previews: some View {
        SeparateLineShape().frame(width: 300, height: 25)
            .foregroundColor(.white)
            .background(Color.white)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 8,
                x: 0,
                y: 0
            )
    }
}
