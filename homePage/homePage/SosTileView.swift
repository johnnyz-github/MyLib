//
//  SosTileView.swift
//  TravelAssist
//
//  Created by Johnny1 on 20/2/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct SosTileView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image("SosPhoneRect").resizable().frame(width: 30, height: 30)
                Spacer()
            }
            HStack{
                Text("Emergency Assistance")
                    .font(.system(size: 20, weight: .medium, design: .default))
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("24/7 global assistance provided by World Travel Protection.")
                .font(.system(size: 15, weight: .light, design: .default))
        }
        .padding()
        .border(.gray)
        .shadow(radius: 2)
        .background(Color.white)
    }
}

struct SosTileView_Previews: PreviewProvider {
    static var previews: some View {
        SosTileView()
    }
}
