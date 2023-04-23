//
//  SeperateLine.swift
//  homePage
//
//  Created by Johnny1 on 27/2/2023.
//

import SwiftUI

struct SeperateLine: Shape {
    var radius : CGFloat = 34
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var x1 = rect.minX
        var y1 = rect.minY
        var x2 = rect.maxX
        var y2 = rect.minY
        var x3 = rect.maxX
        var y3 =  rect.maxY
        var x4 = rect.minX
        var y4 = rect.maxY
        
//        var r = y2 - y1
        print("\(x1), \(y1), \(x2), \(y2), \(radius)")
        let p1 = CGPoint(x: x1, y: y2)
        let p2 = CGPoint(x: (x2 - x1) / 2 - radius , y : y2)
        let p3 = CGPoint(x: (x2 - x1) / 2 + radius, y: y2 )
        let p4 = CGPoint(x: x2, y: y2)
        let po = CGPoint(x: (x2 - x1 ) / 2, y: y2)

        let p5 = CGPoint(x: x3, y: y3 )
        let p6 = CGPoint(x: x4, y: y4 )
        path.move(to: p1)
        path.addLine(to: p4)
        path.addRelativeArc(center: po, radius: radius,
                            startAngle: Angle.degrees(210), delta: Angle.degrees(120))
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.addLine(to: p6)
        path.addLine(to: p1)
        return path
    }
}

struct SeperateLine_Previews: PreviewProvider {
    static var previews: some View {
        SeperateLine().frame(width: 300, height: 3)
            .foregroundColor(.white)
            .background(Color.white)
            .shadow(
                color: Color.gray.opacity(0.3),
                radius: 5,
                x: 0,
                y: -6
            )
    }
}
