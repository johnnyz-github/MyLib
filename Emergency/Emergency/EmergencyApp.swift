//
//  EmergencyApp.swift
//  Emergency
//
//  Created by Johnny1 on 19/5/2023.
//

import SwiftUI

@main
struct EmergencyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
