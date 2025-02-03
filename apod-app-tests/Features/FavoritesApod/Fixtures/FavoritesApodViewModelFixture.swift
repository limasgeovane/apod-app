//
//  FavoritesApodViewModelFixture.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

extension FavoritesApodViewModel {
    static func fixture(
        date: String = "2025-02-02",
        title: String = "Apod title"
    ) -> Self {
        .init(date: date, title: title)
    }
}
