//
//  ContentView.swift
//  DemoWholeScreen
//
//  Created by Johnny1 on 25/8/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showingAlert = true
    var body: some View {
        ZStack{
            Color.blue
            Color.clear
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Call Cover-More Assist?" ),
                        message: Text( "Contact Cover-More Assist, our 24/7 overseas medical and emergency assistance team. We are here to help you at all time." ),
                        primaryButton: .default(Text("Call now")) {
                            
                        },
                        secondaryButton: .cancel()
                    )
                }
        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
