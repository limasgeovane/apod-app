//
//  FavoriteApodsFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import UIKit

enum FavoriteApodsFactory {
    static func make() -> UIViewController {
        let presenter = FavoriteApodsPresenter()
        let interactor = FavoriteApodsInteractor(repository: FavoriteApodsRepository(), presenter: presenter)
        let viewController = FavoriteApodsViewController(interactor: interactor, contentView: FavoriteApodsView())
        presenter.display = viewController
        return viewController
    }
}
