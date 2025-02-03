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
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupTitles() {
        apodViewController.title = Strings.apod
        favoritesApodViewController.title = Strings.favorites
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.secondarySystemBackground
        tabBar.backgroundColor = UIColor.secondarySystemBackground
        
        apodNavigationController.tabBarItem = UITabBarItem(
            title: Strings.apod,
            image: UIImage.universe,
            selectedImage: UIImage.universeFill
        )
        favoritesApodNavigationController.tabBarItem = UITabBarItem(
            title: Strings.favorites,
            image: UIImage.start,
            selectedImage: UIImage.starFill
        )
    }
    
    private func setupViewControllers() {
        viewControllers = [apodNavigationController, favoritesApodNavigationController]
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(favoriteApodSelected),
            name: .favoriteApodSelected,
            object: nil
        )
    }
    
    @objc private func favoriteApodSelected(notification: Notification) {
        selectedIndex = 0
    }
}
