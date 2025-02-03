//
//  FavoritesApodInteractor.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

protocol FavoritesApodInteractorLogic {
    func requestFavoritesApod()
    func requestSelectFavoriteApod(indexPath: IndexPath)
}

class FavoritesApodInteractor: FavoritesApodInteractorLogic {
    private let repository: FavoritesApodRepositoryLogic
    private let presenter: FavoritesApodPresenterLogic
    
    init(repository: FavoritesApodRepositoryLogic, presenter: FavoritesApodPresenterLogic) {
        self.repository = repository
        self.presenter = presenter
    }
    
    func requestFavoritesApod() {
        let favoritesApod = repository.getFavorites()
        
        if favoritesApod.isEmpty {
            presenter.responseEmptyState()
        } else {
            presenter.responseFavoritesApod(favoritesApod: favoritesApod)
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
