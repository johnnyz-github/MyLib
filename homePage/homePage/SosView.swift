//
//  SosView.swift
//  TravelAssist
//
//  Created by Johnny1 on 22/2/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct SosView: View {
    var body: some View {
        VStack {
            title.background(Color.red)
            Spacer()
        }
    }

    var title: some View {
        ZStack {
            Text("Travelex Emergency Assistance")

            HStack {
                Spacer()
                Image(systemName: "xmark").resizable()
                    .frame(width: 16, height: 16, alignment: .center)
                    .padding(.trailing, 16)
            }

        }.foregroundColor(.white)
    }
}

struct SosView_Previews: PreviewProvider {
    static var previews: some View {
        SosView()
    }
}
