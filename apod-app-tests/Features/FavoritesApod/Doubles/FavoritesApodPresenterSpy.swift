//
//  FavoritesApodPresenterSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class FavoritesApodPresenterSpy: FavoritesApodPresenterLogic {
    private(set) var responseFavoritesApodCount = 0
    private(set) var responseFavoritesApodParameterFavoritesApod: [FavoriteApod]?

    func responseFavoritesApod(favoritesApod: [FavoriteApod]) {
        responseFavoritesApodCount += 1
        responseFavoritesApodParameterFavoritesApod = favoritesApod
    }

    private(set) var responseEmptyStateCount = 0

    func responseEmptyState() {
        responseEmptyStateCount += 1
    }
}
