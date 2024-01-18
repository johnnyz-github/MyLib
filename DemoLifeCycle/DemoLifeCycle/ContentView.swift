//
//  ContentView.swift
//  DemoLifeCycle
//
//  Created by Johnny Zhou on 26/9/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showSecond = false
    var body: some View {
        if showSecond {
            SecondView()
        }else{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Button("show second view"){
                    showSecond = true
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
