//
//  FavoriteApodsPresenterSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class FavoriteApodsPresenterSpy: FavoriteApodsPresenterLogic {
    private(set) var responseFavoriteApodsCount = 0
    private(set) var responseFavoriteApodsParameterFavoriteApods: [FavoriteApod]?

    func responseFavoriteApods(FavoriteApods: [FavoriteApod]) {
        responseFavoriteApodsCount += 1
        responseFavoriteApodsParameterFavoriteApods = FavoriteApods
    }

    private(set) var responseEmptyStateCount = 0

    func responseEmptyState() {
        responseEmptyStateCount += 1
    }
}
