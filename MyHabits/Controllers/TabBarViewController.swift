//
//  TabBarController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar(){
        
        view.backgroundColor = .systemGray4
        self.tabBar.tintColor = .red
        
        var controllers: [UIViewController] = []
        
        let habitsViewController = HabitsViewController()
        habitsViewController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "rectangle.grid.1x2.fill"), selectedImage: nil)
        let habitsNavigationController = UINavigationController(rootViewController: habitsViewController)
        controllers.append(habitsNavigationController)
        
        let informationViewController = InformationViewController()
        informationViewController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), selectedImage: nil)
        let informationNavigationController = UINavigationController(rootViewController: informationViewController)
        controllers.append(informationNavigationController)
        
        self.setViewControllers(controllers, animated: true)
    }
    
}
