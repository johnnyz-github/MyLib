//
//  ShadowDividerLine.swift
//  homePage
//
//  Created by Johnny1 on 1/3/2023.
//

import SwiftUI

struct ShadowDividerLine: View {
    var body: some View {
        VStack {
            Spacer()
            shadowDivider
                .offset(y: 57)
            Button(action: {
               
            }) {
                VStack(spacing: 0) {
                    Image("SOSPhone")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44, alignment: .center)
                        .background(Circle().fill(.yellow).frame(width: 50, height: 50))
                    Text("Emergency")
                        .font(.system(size: 20))
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .frame(width: 58)
                }
                .foregroundColor(.red)
            }
            .frame(width: 100)
            .padding(.bottom, 0)
        }
    }
    var shadowDivider: some View{
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
    }
}

struct ShadowDividerLine_Previews: PreviewProvider {
    static var previews: some View {
        ShadowDividerLine()
    }
}
