//
//  HomeTileView.swift
//  TravelAssist
//
//  Created by Johnny1 on 20/2/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct PolicyTileView: View {
    @State var checkState: Bool = false
//    @Injected(Container.theming) private var theming
    @State var pdsPresented: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            statusLine
            NavigationLink(destination: Text("hello")) {
                policyNumberLine
            }
            Divider()
            destinationLine
            Divider()
            startDateLine
            Divider()
            endDateLine
        }
        .background( Color.white)
        .cornerRadius(10)
        .contentShape(Rectangle())
    }

    var statusLine: some View {
        return HStack {
            Text(status)
        }
    }

    var policyNumberLine: some View {
        return HStack {
            Label(policyNumber, image: "PolicyNumberIcon")

            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.white)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .foregroundColor(.white)
        .background(Color.gray)

        .font(.system(size: 17))
    }

    var destinationLine: some View {
        return HStack(alignment: .center, spacing: 5) {
            Text("Destination")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            Spacer()
            Text(destination)
                .foregroundColor(.black)
                .font(.system(size: 15))
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
    }

    var startDateLine: some View {
        return HStack(alignment: .center, spacing: 5) {
            Text("Departure Date")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            Spacer()
            Text(dateStart)
                .foregroundColor(.black)
                .font(.system(size: 15))
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
    }

    var endDateLine: some View {
        return HStack(alignment: .center, spacing: 5) {
            Text("Return Date")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            Spacer()
            Text(dateEnd)
                .foregroundColor(.black)
                .font(.system(size: 15))
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
    }

    var status: String {
        var status = 1
        if status == 1 {
            return "ACTIVE POLICY"
        } else if status == 2 {
            return "Expired POLICY"
        } else {
            return "Cancelled Policy"
        }
    }

    var policyNumber: String {
        "123245ABCDE"
    }

    var rightArrowColor: Color {
        // This is a very special design, i can not understand!!
         .orange
    }

    var destination: String {
        return "Australia"
    }

    var dateStart: String {
        return "02/24/2023"
    }

    var dateEnd: String {
        return "03/15/2023"
    }



}
