//
//  RMTabBarController.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 21.07.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        setupTabs()
    }
    
    private func setupTabs() {
        viewControllers = [
            createNavController(for: RMCharacterVC(), title: "Characters", imageName: "person"),
            createNavController(for: RMLocationVC(), title: "Locations", imageName: "globe"),
            createNavController(for: RMEpisodeVC(), title: "Episodes", imageName: "tv"),
            createNavController(for: RMSettingsVC(), title: "Settings", imageName: "gear")
        ]
    }
    
    private func createNavController(for viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
