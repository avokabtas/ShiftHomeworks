//
//  AppDelegate.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = Colour.accentColour
        UINavigationBar.appearance().tintColor = Colour.accentColour
        
        return true
    }
}
