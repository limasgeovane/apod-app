//
//  FavoritesApodRepositorySpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class FavoritesApodRepositorySpy: FavoritesApodRepositoryLogic {
    private(set) var favoriteCount = 0
    private(set) var favoriteParameterFavoriteApod: FavoriteApod?

    func favorite(favoriteApod: FavoriteApod) {
        favoriteCount += 1
        favoriteParameterFavoriteApod = favoriteApod
    }

    private(set) var getFavoritesCount = 0
    var stubbedGetFavoritesResult: [FavoriteApod] = []

    func getFavorites() -> [FavoriteApod] {
        getFavoritesCount += 1
        return stubbedGetFavoritesResult
    }

    private(set) var unfavoriteCount = 0
    private(set) var unfavoriteParameterFavoriteApod: FavoriteApod?

    func unfavorite(favoriteApod: FavoriteApod) {
        unfavoriteCount += 1
        unfavoriteParameterFavoriteApod = favoriteApod
    }

    private(set) var isApodFavoriteCount = 0
    private(set) var isApodFavoriteParameterDate: String?
    private(set) var stubbedIsApodFavoriteResult: Bool = false

    func isApodFavorite(date: String) -> Bool {
        isApodFavoriteCount += 1
        isApodFavoriteParameterDate = date
        return stubbedIsApodFavoriteResult
    }
}
