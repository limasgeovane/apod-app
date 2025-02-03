//
//  FavoriteApodsPresenter.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

protocol FavoriteApodsPresenterLogic {
    func responseFavoriteApods(favoriteApods: [FavoriteApod])
    func responseEmptyState()
}

final class FavoriteApodsPresenter: FavoriteApodsPresenterLogic {
    weak var display: FavoriteApodsViewControllerLogic?
    
    func responseFavoriteApods(favoriteApods: [FavoriteApod]) {
        let viewModel = favoriteApods.map { favoriteApods in
            return FavoriteApodsViewModel(date: favoriteApods.date.toStringExtended, title: favoriteApods.title)
        }
        
        display?.displayFavoriteApods(viewModel: viewModel)
    }
    
    func responseEmptyState() {
        display?.displayEmptyState()
    }
}
