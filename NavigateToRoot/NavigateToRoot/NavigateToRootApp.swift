//
//  NavigateToRootApp.swift
//  NavigateToRoot
//
//  Created by JohnnyZ on 8/7/2022.
//

import SwiftUI

@main
struct NavigateToRootApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(NavigationHelper())
        }
    }
}
