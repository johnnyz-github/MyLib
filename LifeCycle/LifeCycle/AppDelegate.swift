//
//  AppDelegate.swift
//  LifeCycle
//
//  Created by Johnny1 on 11/2/2023.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        if connectingSceneSession.role == .windowApplication {
            configuration.delegateClass = SceneDelegate.self
        }
        return configuration
    }
}
