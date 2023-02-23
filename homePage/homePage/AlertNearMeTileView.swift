//
//  AlertNearMeTileView.swift
//  TravelAssist
//
//  Created by Johnny1 on 22/2/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct AlertNearMeTileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("TravelAlert").resizable().frame(width: 30, height: 30)
                Spacer()
            }
            HStack{
                Text("Travel Alerts")
                    .font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Stay on top of the latest safety advice and security alerts near you.")
                .font(.system(size: 15, weight: .light, design: .default))
        }
        .padding()
        .border(.gray)
        .shadow(radius: 2)
        .background(Color.white)
    }
}

struct AlertNearMeTileView_Previews: PreviewProvider {
    static var previews: some View {
        AlertNearMeTileView()
    }
}
