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
        self.viewControllers = configureTabBar()
    }
    
    func configureTabBar() -> [UIViewController]{
        view.backgroundColor = .systemGray5
        self.tabBar.tintColor = Constants.navBarTintColor
        self.tabBar.backgroundColor = .systemGray5
        
        var controllers: [UIViewController] = []
        
        let habitsViewController = HabitsViewController()
        habitsViewController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(systemName: "rectangle.grid.1x2.fill"), selectedImage: nil)
        let habitsNavigationController = UINavigationController(rootViewController: habitsViewController)
        controllers.append(habitsNavigationController)
        
        let informationViewController = InformationViewController()
        informationViewController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), selectedImage: nil)
        let informationNavigationController = UINavigationController(rootViewController: informationViewController)
        controllers.append(informationNavigationController)
        
        return controllers
    }
    
}
