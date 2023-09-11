//
//  LifeCycleDemoApp.swift
//  LifeCycleDemo
//
//  Created by Johnny1 on 31/5/2023.
//

import SwiftUI

@main
struct LifeCycleDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
