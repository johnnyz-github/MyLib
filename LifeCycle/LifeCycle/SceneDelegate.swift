//
//  SceneDelegate.swift
//  LifeCycle
//
//  Created by Johnny1 on 11/2/2023.
//

import SwiftUI

class SceneDelegate: NSObject, ObservableObject, UIWindowSceneDelegate {
    var window: UIWindow?   // << contract of `UIWindowSceneDelegate`

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        self.window = windowScene.keyWindow   // << store !!!
    }
}
