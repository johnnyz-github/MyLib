//
//  ContentView.swift
//  DemoRiskCircle
//
//  Created by Johnny Zhou on 29/8/2023.
//

import SwiftUI

struct ContentView: View {
    var progress : Float = 0.3
    var body: some View {
        CircleProgressView(progress: progress, foregroundColor: Color.green)
            .frame(width: 200, height: 200, alignment: .center)
            .overlay(txtInCircle, alignment: .center)
            .padding(.vertical, 16)
            .foregroundColor(.white)
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
//            .background(Color.blue)
    }
    var txtInCircle: some View {
        VStack(spacing: -10) {
            Text("Overall Rating")
//                .font((size: 15))
            Text("1")
//                .font(Font(uiFont: .scaledBold(size: 96)))
            Text( "LOW")
//                .font(Font(uiFont: .scaledMedium(size: 15)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
