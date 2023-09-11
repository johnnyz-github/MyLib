//
//  TabBar.swift
//  DemoTabBar
//
//  Created by Johnny1 on 28/8/2023.
//

import SwiftUI

struct TabBar: View {
    var tabs = ["Active Alerts", "Intelligence", "Risk Rating"]
    @State var tabIndex = 0
    var body: some View {
        GeometryReader { geo in
            let tabWidth: CGFloat = geo.size.width / CGFloat(tabs.count)
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button(action: { tabIndex = index }) {
                        Text(tabs[index])
                            .foregroundColor(.black)
                            .font(Font.custom(index == tabIndex ? "Roboto-Bold" : "Roboto", size: 14))
                    }
                    .padding(2)
                    .background(RoundedRectangle(cornerRadius: 9, style: .continuous).fill(index == tabIndex ? Color.white : Color.clear).frame(width: tabWidth , height: 28))
                    .overlay(RoundedRectangle(cornerRadius: 9, style: .continuous).strokeBorder(index == tabIndex ? Color.gray : Color.clear, lineWidth: 2).frame(width: tabWidth , height: 28))
                    .frame(width: tabWidth, height: 28)
                    Divider().frame(height: 20)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 9).fill(Color.gray)
                    .frame(width: geo.size.width ,
                           height: 28, alignment: .center)
            )
            
            .animation(.default, value: tabIndex)
        }
        .padding()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
