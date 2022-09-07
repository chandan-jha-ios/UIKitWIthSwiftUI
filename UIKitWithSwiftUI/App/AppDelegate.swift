//
//  AppDelegate.swift
//  UIKitWithSwiftUI
//
//  Created by Chandan Jha on 07/09/22.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        showHomeOrLogin()
        return true
    }

    @objc func showHomeOrLogin() {
        if UserDefaults.standard.value(forKey: "user") != nil {
            let home = HomeView()
            let controller = UIHostingController(rootView: home)
            window?.rootViewController = controller
        } else if let controller = LoginController.loadController() {
            let navigation = UINavigationController(rootViewController: controller)
            window?.rootViewController = navigation
        }
    }
}

