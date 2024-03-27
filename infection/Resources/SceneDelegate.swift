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
        
        let parametersViewController = ParametersTVC() // Создаем экземпляр вашего контроллера
        
//        let infectionVC = InfectionViewController()
//        let width = infectionVC.view.bounds.width
//        print("Width = \(infectionVC.view.bounds.width)")
//        infectionVC.population = PopulationManager(groupSize: 420, infectionFactor: 6, period: 1)
        let navigationController = UINavigationController(rootViewController: parametersViewController) // Создаем UINavigationController с вашим контроллером в качестве rootViewController
//        let navigationController = UINavigationController(rootViewController: infectionVC) // Создаем UINavigationController с вашим контроллером в качестве rootViewController
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
    }

}

