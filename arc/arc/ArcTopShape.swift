//
//  ArcTopShape.swift
//  arc
//
//  Created by JohnnyZ on 4/5/2022.
//

import SwiftUI

struct ArcTopShape: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tl = CGPoint(x: rect.minX, y: rect.maxY)
        let tr = CGPoint(x: rect.maxX, y: rect.maxY)
        let brs = CGPoint(x: rect.maxX, y: rect.maxY - radius)
        let brc = CGPoint(x: rect.maxX - radius, y: rect.minY + radius)
        let bls = CGPoint(x: rect.minX + radius, y: rect.minY )
        let blc = CGPoint(x: rect.minX + radius , y: rect.minY + radius)
        
        path.move(to: tl)
        path.addLine(to: tr)
        path.addLine(to: brs)
        path.addRelativeArc(center: brc, radius: radius,
          startAngle: Angle.degrees(0), delta: Angle.degrees(-90))
        path.addLine(to: bls)
        path.addRelativeArc(center: blc, radius: radius,
          startAngle: Angle.degrees(-90), delta: Angle.degrees(-90))
        
        return path
    }
}

struct ArcTopShape_Previews: PreviewProvider {
    static var previews: some View {
        ArcTopShape(radius: 20)
    }
}
