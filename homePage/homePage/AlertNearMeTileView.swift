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
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("TravelAlert").resizable().frame(width: 30, height: 30)
                Spacer()
            }
            HStack{
                Text("Travel Alerts")
                    .foregroundColor(.apacGray800)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .frame(width: 100, alignment: .leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.apacBlue)
            }
            Text("Stay on top of the latest safety advice and security alerts near you.")
                .foregroundColor(.apacGray600)
                .font(.system(size: 15, weight: .regular, design: .default))
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(ShadowBackground())
    }
   
}

struct AlertNearMeTileView_Previews: PreviewProvider {
    static var previews: some View {
        AlertNearMeTileView()
    }
}
