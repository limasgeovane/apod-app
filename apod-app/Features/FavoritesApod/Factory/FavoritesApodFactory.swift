//
//  FavoritesApodFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import UIKit

enum FavoritesApodFactory {
    static func make() -> UIViewController {
        let presenter = FavoritesApodPresenter()
        let interactor = FavoritesApodInteractor(repository: FavoritesApodRepository(), presenter: presenter)
        let viewController = FavoritesApodViewController(interactor: interactor, contentView: FavoritesApodView())
        presenter.display = viewController
        return viewController
    }
}
