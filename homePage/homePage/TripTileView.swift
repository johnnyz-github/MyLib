//
//  TripTileView.swift
//  TravelAssist
//
//  Created by Johnny1 on 22/2/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct TripTileView: View {
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 12){
                Label("Your Destinations", image: "TripTileIcon" )
                    .foregroundColor(.apacGray800)
                    .font(.system(size: 20, weight: .regular, design: .default))
                Text("Keep up to date with the latest travel advice for your destinations.")
                    .foregroundColor(.apacGray600)
                    .font(.system(size: 15, weight: .regular, design: .default))
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.apacBlue)
        }
        .padding()
        .background(ShadowBackground())
        .padding()
    }
}

struct TripTileView_Previews: PreviewProvider {
    static var previews: some View {
        TripTileView()
    }
}
