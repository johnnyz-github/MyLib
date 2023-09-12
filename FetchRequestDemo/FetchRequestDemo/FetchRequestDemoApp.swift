//
//  FetchRequestDemoApp.swift
//  FetchRequestDemo
//
//  Created by Johnny1 on 23/4/2023.
//

import SwiftUI

@main
struct FetchRequestDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, DbContext.mock.container.viewContext)
        }
    }
}
