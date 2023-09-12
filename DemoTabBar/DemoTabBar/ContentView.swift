//
//  ContentView.swift
//  DemoTabBar
//
//  Created by Johnny1 on 28/8/2023.
//

import SwiftUI

struct ContentView: View {
    var tabs = ["Active Alerts", "Intelligence", "Risk Rating"]
    @State var tabIndex = 0
    let padSize : CGFloat = 8
    
    var body: some View {

            
            GeometryReader { geo in
                let wid = geo.size.width - CGFloat(tabs.count) * 2.0 * padSize
                let tabWidth: CGFloat = wid / CGFloat(tabs.count)
                HStack(spacing: 0) {
                    ForEach(tabs.indices, id: \.self) { index in
                        Button(action: { tabIndex = index }) {
                            Text(tabs[index])
                                .foregroundColor(.black)
                                .font(index == tabIndex ? Font.custom("Roboto-Bold", size: 14) : Font.custom("Roboto", size: 14))
                                .background(RoundedRectangle(cornerRadius: 9, style: .continuous).fill(index == tabIndex ? Color.white : Color.clear)
                                    .frame(width: tabWidth , height: 24, alignment: Alignment.topLeading))
                        }

                    }
                }
                .background(RoundedRectangle(cornerRadius: 9, style: .continuous)
                    .fill(Color.gray)

                    .frame(height: 28))
            }
        
        .padding()
//        .frame(height: 28)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
