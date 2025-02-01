//
//  MainTabBarController.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import UIKit

final class MainTabBarController: UITabBarController {
    private let apodViewController = ApodFactory.make()
    private lazy var apodNavigationController = UINavigationController(rootViewController: apodViewController)
    
    private let favoritesApodViewController = FavoritesApodFactory.make()
    private lazy var favoritesApodNavigationController = UINavigationController(rootViewController: favoritesApodViewController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitles()
        setupTabBar()
        setupViewControllers()
    }

    private func setupTitles() {
        apodViewController.title = "Apod"
        favoritesApodViewController.title = "Favorites"
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.secondarySystemBackground
        tabBar.backgroundColor = UIColor.secondarySystemBackground

        apodNavigationController.tabBarItem = UITabBarItem(
            title: "Apod",
            image: UIImage(named: "universe"),
            selectedImage: UIImage(named: "universe-fill")
        )
        favoritesApodNavigationController.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(named: "start"),
            selectedImage: UIImage(named: "star-fill")
        )
    }
    
    private func setupViewControllers() {
        viewControllers = [apodNavigationController, favoritesApodNavigationController]
    }
}
