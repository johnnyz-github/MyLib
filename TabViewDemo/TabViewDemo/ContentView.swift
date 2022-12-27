//
//  ContentView.swift
//  TabViewDemo
//
//  Created by Johnny1 on 13/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
//        NavigationView {
        VStack(spacing: 0) {
            AlertmeTabView(selection: $selectedTab, titles: ["MAP", "LIST"])
            Spacer().background(Color.blue)
            if selectedTab == 0 {
                Text("I love you")
                    .background(Color.pink)
            } else {
                Text("I hate you")
            }
            Spacer()
        }
//    }
    }
}
struct AlertmeTabView: View {
    @Binding var selection: Int
    let titles: [String]

    @State private var frames = [CGRect](repeating: .zero, count: 2)

    
    var body: some View {
//        ZStack {
        GeometryReader { geo in
            let tabWidth : CGFloat = geo.size.width / CGFloat(frames.count)
            HStack(spacing: 0) {
                ForEach(self.titles.indices, id: \.self) { index in
                    Button(action: { self.selection = index }) {
                        Text(self.titles[index])
                            
                            .foregroundColor(index == selection ? Color.orange: Color.gray)
                            .font(Font.custom("Roboto-Bold", size: 14))
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .frame(width: tabWidth, height: 50
                )
//                    .background(Color.yellow)
//                    .background(
//
//                            Color.clear.onAppear { self.setFrame(index: index, frame: geo.frame(in: .global)) }
//                        }
//                    )
                }
            }
            .background(
                Capsule().fill(Color.orange)
                    .frame(width: geo.size.width/CGFloat(frames.count),
                           height: 2, alignment: .topLeading)
                    .offset(x: CGFloat(self.selection) * tabWidth),
                alignment: .bottomLeading
            )
            .animation(.default, value: selection)
        }
        
//        .background(Color.white)
        .frame(height: 50)
    }

    private func setFrame(index: Int, frame: CGRect) {
        frames[index] = frame
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
