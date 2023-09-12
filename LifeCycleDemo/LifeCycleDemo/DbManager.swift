//
//  DbManager.swift
//  TravelAssist
//
//  Created by Johnny1 on 5/4/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import CoreData
import Foundation



class DbManager {
    static let shared = DbManager()
    private static let expiredDays = 30

    var container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { storeDescription, error in
            if let error {
                print("DB init error \(error.localizedDescription)")
            }
        }
    }

}
