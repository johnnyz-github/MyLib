//
//  ContentView.swift
//  homePage1
//
//  Created by Johnny Zhou on 24/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeHomeView().tabItem{Label("home", systemImage: "house")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
