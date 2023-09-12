//
//  TextFieldDemoApp.swift
//  TextFieldDemo
//
//  Created by Johnny1 on 11/9/2023.
//

import SwiftUI

@main
struct TextFieldDemoApp: App {
    @State var searchText = ""
    @State var isActivated = false
    var body: some Scene {
        WindowGroup {
            ContentView(text: $searchText, isActivated: $isActivated)
        }
    }
}
