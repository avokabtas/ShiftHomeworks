//
//  SceneDelegate.swift
//  HW7
//
//  Created by Aliia Satbakova  on 29.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let imageLoader = ImageLoader()
        let presenter = ImageListPresenter(ui: nil, imageLoader: imageLoader)
        
        let viewController = ImageListViewController(presenter: presenter)
        presenter.ui = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
