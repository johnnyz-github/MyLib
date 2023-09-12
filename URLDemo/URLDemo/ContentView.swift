//
//  ContentView.swift
//  URLDemo
//
//  Created by Johnny1 on 16/6/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            WebView(pageType: .privacy)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
