//
//  FavoriteApodsInteractor.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

protocol FavoriteApodsInteractorLogic {
    func requestFavoriteApods()
    func requestSelectFavoriteApod(indexPath: IndexPath)
}

class FavoriteApodsInteractor: FavoriteApodsInteractorLogic {
    private let repository: FavoriteApodsRepositoryLogic
    private let presenter: FavoriteApodsPresenterLogic
    
    init(repository: FavoriteApodsRepositoryLogic, presenter: FavoriteApodsPresenterLogic) {
        self.repository = repository
        self.presenter = presenter
    }
    
    func requestFavoriteApods() {
        let FavoriteApods = repository.getFavorites()
        
        if FavoriteApods.isEmpty {
            presenter.responseEmptyState()
        } else {
            presenter.responseFavoriteApods(FavoriteApods: FavoriteApods)
        }
    }
    
    func requestSelectFavoriteApod(indexPath: IndexPath) {
        let apod = repository.getFavorites()[indexPath.row]
        
        NotificationCenter.default.post(
            name: .favoriteApodSelected,
            object: nil ,
            userInfo: ["apodDate": apod.date]
        )
    }
}
