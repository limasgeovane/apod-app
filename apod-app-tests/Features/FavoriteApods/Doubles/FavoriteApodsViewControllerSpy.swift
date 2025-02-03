//
//  FavoriteApodsViewControllerSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class FavoriteApodsViewControllerSpy: FavoriteApodsViewControllerLogic {
    private(set) var displayFavoriteApodsCount = 0
    private(set) var displayFavoriteApodsParameterViewModel: [FavoriteApodsViewModel] = []

    func displayFavoriteApods(viewModel: [FavoriteApodsViewModel]) {
        displayFavoriteApodsCount += 1
        displayFavoriteApodsParameterViewModel = viewModel
    }

    private(set) var displayEmptyStateCount = 0

    func displayEmptyState() {
        displayEmptyStateCount += 1
    }
}
