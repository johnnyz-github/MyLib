//
//  ContentView.swift
//  movPlay
//
//  Created by Johnny1 on 1/2/2023.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                LoopingPlayer()
                NavigationLink(destination: LoginWelcomeView().navigationBarTitleDisplayMode(.inline), isActive: $show, label: {
                    EmptyView()
                })
            }
            .ignoresSafeArea()
            .onAppear {
                print("splash screen now")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    print("after 2 seconds")
//                    self.show.toggle()
                }
            }
            .navigationBarHidden(true)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
