//
//  AppDelegate.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 05/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var homeCoordinator: HomeCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator?.start()

        return true
    }
}
