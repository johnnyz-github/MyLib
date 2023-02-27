//
//  CurvedShadowView.swift
//  homePage
//
//  Created by Johnny1 on 27/2/2023.
//

import SwiftUI

struct CurvedShadowView: View {
    var body: some View {
        ZStack {
            Color.white // Replace with your desired background color
            
            // Create the curved shape
            Path { path in
                let width = UIScreen.main.bounds.width
                let height = UIScreen.main.bounds.height
                path.move(to: .zero)
                path.addQuadCurve(to: CGPoint(x: width, y: 0), control: CGPoint(x: width/2, y: height/2))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
                path.closeSubpath()
            }
            .fill(Color.white)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct CurvedShadowView_Previews: PreviewProvider {
    static var previews: some View {
        CurvedShadowView()
    }
}
