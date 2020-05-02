//
//  AppDelegate.swift
//  iMovie
//
//  Created by SHABEERALI K on 26/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
     
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // self.showMovieListView()
        return true
    }
    
    func showMovieListView() {
        
        /* Create ui-view-controller instance*/
             let mov = MovieListRouter.createMovieListModule()

             /* Initiating instance of ui-navigation-controller with view-controller */
             let navigationController = UINavigationController()
             navigationController.viewControllers = [mov]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

             /* Setting up the root view-controller as ui-navigation-controller */
            // window = UIWindow(frame: UIScreen.main.bounds)
           //  window?.rootViewController = navigationController
          //   window?.makeKeyAndVisible()
        //let movieListNavigationController = MovieListRouter.createMovieListModule()
       // UIApplication.shared.windows.first?.rootViewController = navigationController
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

