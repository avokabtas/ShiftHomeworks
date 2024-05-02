//
//  TabBarController.swift
//  HW3
//
//  Created by Aliia Satbakova  on 29.04.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let profileVC = storyboard.instantiateViewController(withIdentifier: "profile") as? ProfileViewController  else {
            fatalError("Controller can not iniated!")
        }
        let hardSkillsVC = HardSkillsViewController()
        let hobbyVC = HobbyViewController()
        
        let profileIcon = UIImage(systemName: "person")
        let hardSkillsIcon = UIImage(systemName: "laptopcomputer")
        let hobbyIcon = UIImage(systemName: "heart")
        
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: profileIcon, selectedImage: nil)
        hardSkillsVC.tabBarItem = UITabBarItem(title: "Навыки", image: hardSkillsIcon, selectedImage: nil)
        hobbyVC.tabBarItem = UITabBarItem(title: "Хобби", image: hobbyIcon, selectedImage: nil)
        
        self.viewControllers = [profileVC, hardSkillsVC, hobbyVC]
    }
}
