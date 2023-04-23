//
//  DbContext.swift
//  FetchRequestDemo
//
//  Created by Johnny1 on 23/4/2023.
//

import Foundation
import CoreData

struct DbContext {
    static var shared = DbContext()
    var container : NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "Demo")
        container.loadPersistentStores{ description, error in
            guard let error = error else {
                return
            }
        }
    }
    static var mock : DbContext = {
        let db = DbContext()
        for i in 0..<10 {
            let user = User(context: db.container.viewContext)
            user.name = "user \(i)"
            user.age = 16
        }
        return db
    }()
}
