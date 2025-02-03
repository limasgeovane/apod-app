//
//  FavoriteApodFixture.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

extension FavoriteApod {
    static func fixture(
        date: Date = "2025-02-02".toDate,
        title: String = "Apod title"
    ) -> Self {
        .init(date: date, title: title)
    }
}
