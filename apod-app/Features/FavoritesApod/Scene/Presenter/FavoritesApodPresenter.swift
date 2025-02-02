//
//  FavoritesApodPresenter.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

protocol FavoritesApodPresenterLogic {
    func responseFavoritesApod(favoritesApod: [FavoriteApod])
    func responseEmptyState()
}

final class FavoritesApodPresenter: FavoritesApodPresenterLogic {
    weak var display: FavoritesApodViewControllerLogic?
    
    func responseFavoritesApod(favoritesApod: [FavoriteApod]) {
        let viewModel = favoritesApod.map { favoritesApod in
            return FavoritesApodViewModel(date: favoritesApod.date, title: favoritesApod.title)
        }
        
        display?.displayFavoritesApod(viewModel: viewModel)
    }
    
    func responseEmptyState() {
        display?.displayEmptyState()
    }
}
