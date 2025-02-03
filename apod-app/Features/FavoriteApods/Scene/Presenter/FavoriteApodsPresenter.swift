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
        
        let favoritesSorteds = favoriteApods.sorted { $0.date > $1.date }
        
        let viewModel = favoritesSorteds.map { FavoriteApods in
            return FavoriteApodsViewModel(date: FavoriteApods.date.toStringExtended, title: FavoriteApods.title)
        }
        
        display?.displayFavoriteApods(viewModel: viewModel)
    }
    
    func responseEmptyState() {
        display?.displayEmptyState()
    }
}
