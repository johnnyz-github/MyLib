//
//  ContentView.swift
//  TabsDemo
//
//  Created by Johnny1 on 17/7/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var selectedTab = "One"

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")

            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
            Text("Tab 3")
                .tabItem {
                    Label("Three", systemImage: "circle")
                }
                .tag("Three")
        }
        .onReceive(Just(selectedTab)) {
                         print("Tapped!!")
                    if $0 == "Three" {
                        selectedTab = "One"
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
