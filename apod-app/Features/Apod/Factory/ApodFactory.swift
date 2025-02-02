//
//  ApodFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit

enum ApodFactory {
    static func make() -> UIViewController {
        let presenter = ApodPresenter()
        let interactor = ApodInteractor(
            repository: ApodRepository(),
            favoriteApodRepository: FavoritesApodRepository(),
            presenter: presenter
        )
        let viewController = ApodViewController(interactor: interactor, contentView: ApodView())
        presenter.display = viewController
        
        return viewController
    }
}
