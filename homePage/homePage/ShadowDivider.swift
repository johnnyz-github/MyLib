//
//  ShadowDivider.swift
//  homePage
//
//  Created by Johnny Zhou on 28/2/2023.
//

import SwiftUI

struct ShadowDivider: Shape {
    var r : CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var x0 = rect.minX
        var y0 = rect.minY
        var xl = rect.maxX - rect.minX
        var yl = rect.maxY - rect.minY
        
        let t1 = CGPoint(x:x0,  y: y0)
        let t2 = CGPoint(x: x0 + xl / 2 - r, y: y0)
        let t3 = CGPoint(x: x0 + xl / 2 + r, y: y0)
        let t4 = CGPoint(x: x0 + xl, y: y0)
        let t5 = CGPoint(x: x0 + xl , y: y0 + yl)
        let t6 = CGPoint(x: x0, y: y0 + yl )

        path.move(to: t1)
        path.addLine(to: t2)
        
        path.addRelativeArc(center: CGPoint( x: x0 + xl / 2, y: y0), radius: r,
                            startAngle: Angle.degrees(190), delta: Angle.degrees(180))
        path.addLine(to: t4)
        
        path.addLine(to: t5)
        path.addLine(to: t6)
        path.closeSubpath()
        return path
    }
}

struct ShadowDivider_Previews: PreviewProvider {
    static var previews: some View {
        ShadowDivider(r: 24)
            .foregroundColor(.white)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 0)
//            .mask(
//                Rectangle()
//                    .frame(height: 5)
//                    .foregroundColor(.black)
//            )
            .frame(height: 200)
    }
}
