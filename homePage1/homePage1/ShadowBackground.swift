//
//  ShadowBackground.swift
//  homePage1
//
//  Created by Johnny Zhou on 24/2/2023.
//

import SwiftUI

struct ShadowBackground: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .cornerRadius(5)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 8,
                x: 0,
                y: 0
            )
    }
}

struct ShadowBackground_Previews: PreviewProvider {
    static var previews: some View {
        ShadowBackground()
    }
}
