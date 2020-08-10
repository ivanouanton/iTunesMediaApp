//
//  SceneDelegate.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/4/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = ViewFactory.createITunesMediaController()
        let navController = UINavigationController(rootViewController: vc)
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
}

