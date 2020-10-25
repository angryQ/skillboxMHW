//
//  SceneDelegate.swift
//  DZ8
//
//  Created by Kristina Kudinova on 15.10.2020.
//  Copyright © 2020 Kristina Kudinova. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds )// UIScreen.main.bounds
        window?.windowScene = windowScene
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "hasLaunched")
        var vc: UIViewController
        
        if launchedBefore {
            vc = createTabbar()
        } else {
            let launchStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
            vc = launchStoryboard.instantiateViewController(withIdentifier: "PageViewController")
            
        }
        
        UserDefaults.standard.set(true, forKey: "hasLaunched")
        
        /*
         let conVC = ContainerViewController()
         let storyboard = UIStoryboard(name: "Gallery", bundle: nil)
         let galleryController = storyboard.instantiateViewController(identifier: "GalleryID")
         
         let buttonTitle = "Выключить"
         conVC.addVC(GreenViewController(), buttonTitle: buttonTitle)
         conVC.addVC(BlueViewController(), buttonTitle: buttonTitle)
         conVC.addVC(galleryController, buttonTitle: buttonTitle)
         
         let defaultVC = PurpleViewController()
         conVC.setDefaultPlaceholder(defaultVC)
         */
        
        
        //window?.rootViewController = conVC
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    func createTabbar() -> UITabBarController {
        
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.4666666667, blue: 0.3294117647, alpha: 1)
        
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes, for: .normal)
        
        tabBar.viewControllers = [createGalleryViewController(), createFourImagesViewController(),
                                  createSegmentedViewController(), createContainerViewController()]
        return tabBar
    }
    
    func createGalleryViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Gallery", bundle: nil)
        let galleryVC = storyboard.instantiateViewController(identifier: "GalleryID")
        galleryVC.tabBarItem =  UITabBarItem(title: "Task #1", image: nil, tag: 0)
        
        return galleryVC
    }
    
    func createFourImagesViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "FourImages", bundle: nil)
        let fourImagesVC = storyboard.instantiateViewController(identifier: "ImagesInLoop")
        
        let conVC = ContainerViewController()
       // let buttonTitle = "Выключить"
        conVC.tabBarItem = UITabBarItem(title: "Task #2", image: nil, tag: 1)
        conVC.addVC(fourImagesVC, buttonTitle: nil)
        
        return conVC
    }
    
    func createSegmentedViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Segmented", bundle: nil)
        let segmentedVC = storyboard.instantiateViewController(identifier: "SegmentedNC")
        segmentedVC.tabBarItem = UITabBarItem(title: "Task #3", image: nil, tag: 2)
        
        return segmentedVC
    }
    
    func createContainerViewController() -> UIViewController {
        let conVC = ContainerViewController()
        let buttonTitle = "Выключить"
        
        conVC.addVC(GreenViewController(), buttonTitle: buttonTitle)
        conVC.addVC(BlueViewController(), buttonTitle: buttonTitle)
        //conVC.addVC(PurpleViewController(), buttonTitle: buttonTitle)
        
        let defaultVC = PurpleViewController()
        conVC.setDefaultPlaceholder(defaultVC)
        
        conVC.tabBarItem = UITabBarItem(title: "Additional", image: nil, tag: 3)
        
        return conVC
    }
    
    func createGreenViewController() -> UIViewController {
        let greenVC = GreenViewController()
        greenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 5)
        
        return greenVC
    }
    
    func createBlueViewController() -> UIViewController {
        let blueVC = BlueViewController()
        blueVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        
        return blueVC
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
    
    func changeRootViewController(animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        window.rootViewController = createTabbar()
    }
    
    
}
