//
//  DemoTabViewHideApp.swift
//  DemoTabViewHide
//
//  Created by Johnny1 on 22/8/2023.
//

import SwiftUI

@main
struct DemoTabViewHideApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
        var body: some Scene {
            WindowGroup {
                TabView {
                    
                NavigationView {
                    
                    
                   DarkMenuView()
                    
                    
                }.tabItem {
                    
                   Image(systemName: "homekit")
                    Text("home")
                    
                 }
                    Text("Liked")
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Liked")
                        }
                    Text("Reels")
                        .tabItem {
                            Image(systemName: "video")
                            Text("Reels")
                                .environment(\.colorScheme, isDarkMode ? .dark : .light)
                                .preferredColorScheme(isDarkMode ? .dark : .light)
                            
                        }
                    Text("Profile")
                        .tabItem {
                            
                            Image(systemName: "person")
                            Text("Profile")
                        }
                       
                }.accentColor(.primary)
            }
        }
}
