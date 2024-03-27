//
//  SceneDelegate.swift
//  infection
//
//  Created by Nikita Evdokimov on 21.03.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let parametersViewController = ParametersTVC() 
        
        let navigationController = UINavigationController(rootViewController: parametersViewController)
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
    }

}

