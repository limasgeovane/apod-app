//
//  FavoritesApodViewControllerSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class FavoritesApodViewControllerSpy: FavoritesApodViewControllerLogic {
    private(set) var displayFavoritesApodCount = 0
    private(set) var displayFavoritesApodParameterViewModel: [FavoritesApodViewModel] = []

    func displayFavoritesApod(viewModel: [FavoritesApodViewModel]) {
        displayFavoritesApodCount += 1
        displayFavoritesApodParameterViewModel = viewModel
    }

    private(set) var displayEmptyStateCount = 0

    func displayEmptyState() {
        displayEmptyStateCount += 1
    }
}
