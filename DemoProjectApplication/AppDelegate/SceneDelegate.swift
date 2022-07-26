//
//  SceneDelegate.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 19/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationVC: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        navigationVC = UINavigationController()
        guard let _ = (scene as? UIWindowScene) else { return }
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let user = "User"
        if user != nil {
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            navigationVC?.setViewControllers([viewController], animated: true)
        } else {
            let signupVC = mainStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
            navigationVC?.setViewControllers([signupVC], animated: true)
        }
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

