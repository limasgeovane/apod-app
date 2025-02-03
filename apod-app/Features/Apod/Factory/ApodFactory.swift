//
//  ApodFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit

enum ApodFactory {
    static func make() -> UIViewController {
        let dateProvider = DefaultDateProvider()
        let presenter = ApodPresenter(dateProvider: dateProvider)
        let interactor = ApodInteractor(
            repository: ApodRepository(),
            favoriteApodsRepository: FavoriteApodsRepository(),
            presenter: presenter,
            dateProvider: dateProvider
        )
        let viewController = ApodViewController(interactor: interactor, contentView: ApodView())
        presenter.display = viewController
        
        return viewController
    }
}
