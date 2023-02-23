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
            VStack (alignment: .leading){
                Label("Your Destinations", image: "TripTileIcon" ) 
                Text("Keep up to date with the latest travel advice for your destinations.")
                    .font(.system(size: 15, weight: .light, design: .default))
            }
            
            .shadow(radius: 2)
            .background(Color.white)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
    }
}

struct TripTileView_Previews: PreviewProvider {
    static var previews: some View {
        TripTileView()
    }
}
