//
//  ContentView.swift
//  homePage
//
//  Created by Johnny1 on 27/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                HomeHomeView().tabItem{Label("home", systemImage: "house")}
                PolicyView().tabItem{Label("policy", systemImage: "house")}
            }
            VStack{
                Spacer()
                ShadowDivider(r: 24)
                    .foregroundColor(.gray.opacity(0.3))
                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x : 0 , y : -5)
                    .frame(height: 1)
                    .padding(.bottom, 50)
                Button("Emergency"){
                    Image("SOSPhone")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
