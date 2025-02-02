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
    private let repository: FavoritesApodRepository
    private let presenter: FavoritesApodPresenterLogic
    
    init(repository: FavoritesApodRepository, presenter: FavoritesApodPresenterLogic) {
        self.repository = repository
        self.presenter = presenter
    }
    
    func requestFavoritesApod() {
        let favoritesApod = repository.getFavorites()
        presenter.responseFavoritesApod(favoritesApod: favoritesApod)
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
