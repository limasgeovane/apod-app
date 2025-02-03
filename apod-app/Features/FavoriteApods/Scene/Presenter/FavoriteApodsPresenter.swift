//
//  FavoriteApodsPresenter.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

protocol FavoriteApodsPresenterLogic {
    func responseFavoriteApods(FavoriteApods: [FavoriteApod])
    func responseEmptyState()
}

final class FavoriteApodsPresenter: FavoriteApodsPresenterLogic {
    weak var display: FavoriteApodsViewControllerLogic?
    
    func responseFavoriteApods(FavoriteApods: [FavoriteApod]) {
        let viewModel = FavoriteApods.map { FavoriteApods in
            return FavoriteApodsViewModel(date: FavoriteApods.date, title: FavoriteApods.title)
        }
        
        display?.displayFavoriteApods(viewModel: viewModel)
    }
    
    func responseEmptyState() {
        display?.displayEmptyState()
    }
}
