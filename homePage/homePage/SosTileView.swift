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
        VStack(alignment: .leading, spacing: 12){
            HStack {
                Image("SosPhoneRect").resizable().frame(width: 30, height: 30)
                Spacer()
            }
            HStack{
                Text("Emergency Assistance")
                    .foregroundColor(.apacGray800)
                    .font(.system(size: 20, weight: .regular, design: .default))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.apacBlue)
            }
            Text("24/7 global assistance provided by World Travel Protection.")
                .foregroundColor(.apacGray600)
                .font(.system(size: 15, weight: .regular, design: .default))
        }
        .padding()
        .cornerRadius(10)
        .frame(maxHeight: .infinity)
        .background(ShadowBackground() )
    }
    
}

struct SosTileView_Previews: PreviewProvider {
    static var previews: some View {
        SosTileView()
    }
}
