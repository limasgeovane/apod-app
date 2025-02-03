//
//  FavoriteApodsViewModelFixture.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

extension FavoriteApodsViewModel {
    static func fixture(
        date: String = "2 Feb 2025",
        title: String = "Apod title"
    ) -> Self {
        .init(date: date, title: title)
    }
}
