//
//  AppDelegate.swift
//  UITestBackground
//
//  Created by Masi, Ennio (Senior iOS Developer) on 23/05/2017.
//  Copyright © 2017 Ennio Masi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loadedValue: Int {
        get {
            return UserDefaults.standard.integer(forKey: "myCleverValue")
//            return 1
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "myCleverValue")
            UserDefaults.standard.synchronize()
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        loadedValue = 0
        print("🤖 1' exec loadedValue 🤖 \(loadedValue)")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        loadedValue = 1
        print("🤖 enter foreground loadedValue 🤖 \(loadedValue)")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        loadedValue = 0
        
        print("🤖 goint to be killed loadedValue 🤖 \(loadedValue)")
    }


}

