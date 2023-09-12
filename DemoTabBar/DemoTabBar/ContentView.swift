//
//  ContentView.swift
//  DemoTabBar
//
//  Created by Johnny Zhou on 30/8/2023.
//

import SwiftUI

struct ContentView: View {
    var tabs = ["Active Alerts", "Intelligence", "Risk Rating"]
    @State var tabIndex = 0
    @State var tabBarWidth: CGFloat = 0
    var body: some View {
        GeometryReader { geo in
            let tabWidth: CGFloat = geo.size.width / CGFloat(tabs.count)
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in

                    Button(action: { tabIndex = index }) {
                        Text(tabs[index])
                            .foregroundColor(Color.black)
                            .font(Font.custom(index == tabIndex ? "Roboto-Bold" : "Roboto", size: 14))
                        
                            .background(
                                RoundedRectangle(cornerRadius: 7).fill(index == tabIndex ? Color.white : Color.clear)
                                    .shadow(
                                        color: Color.gray.opacity(0.7),
                                        radius: 2,
                                        x: 2,
                                        y: 2
                                    )
                                    .frame( width:  tabWidth - 4, height: 24, alignment: .leading)
                            )
                            .frame(width: tabWidth, height: 28)
                    }
                        if index != tabIndex   && tabIndex != index + 1{
                            Divider().frame(height: 14)
                        }
                    
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 9).fill(Color.white)
                    .frame(width: geo.size.width, height: 28, alignment: .center)
            )

            .animation(.default, value: tabIndex)
        }
        .padding(.horizontal, 26)
        .padding(.top, -8)
        .padding(.bottom, 26)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
