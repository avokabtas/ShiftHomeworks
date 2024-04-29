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
        
        profileVC.title = "Профиль"
        hardSkillsVC.title = "Навыки"
        hobbyVC.title = "Хобби"
        
        // Добавляем контроллеры в массив viewControllers
        self.viewControllers = [profileVC, hardSkillsVC, hobbyVC]
    }
    
    
}
