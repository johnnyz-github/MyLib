//
//  shadowDemo.swift
//  homePage
//
//  Created by Johnny1 on 1/3/2023.
//

import SwiftUI

struct ShadowDivider: View {
    var body: some View {
//        ZStack{
            ZStack{
                Rectangle().fill(.white).frame(height: 5).offset(y: -8)
                Circle().fill(.white).frame(width: 50, height: 50)
            }
            .shadow(
                color: Color.gray.opacity(0.3),
                radius: 5,
                x: 0,
                y: -7
            )
//            Rectangle().fill(.yellow).frame(height: 5).offset(y: 10)
//        }
    }
}

struct ShadowDivider_Previews: PreviewProvider {
    static var previews: some View {
        ShadowDivider()
    }
}
