//
//  policysTileCarousel.swift
//  TravelAssist
//
//  Created by Johnny1 on 25/2/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct PolicysTileCarousel: View {
//    @ObservedObject var policyViewModel: PolicyViewModel
    var policyList : [ String ]
    var backColor = Color.apacBlue
    var body: some View {
            if  policyList.count > 0 {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(policyList, id: \.self) { item in
                            PolicyTileView()
                                .frame(width: 279, height: 190)
                        }
                    }
                    .background(backColor)
                }
            } else {
                policyAddTile
            }

       
    }

    var policyAddTile: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 230, height: 177)
            Image(systemName: "plus")
                .foregroundColor(.gray)
        }
    }
}

// struct policysTileCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        policysTileCarousel()
//    }
// }
