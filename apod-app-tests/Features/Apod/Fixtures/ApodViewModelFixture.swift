//
//  ApodViewModelFixture.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

extension ApodViewModel {
    static func fixture(
        mediaURL: URL? = URL(string: "https://apod.hdurl.com"),
        mediaType: Apod.MediaType = .image,
        title: String = "Apod title",
        description: String = "Apod explanation",
        date: Date = "2025-02-02".toDate,
        isHiddenNextButton: Bool = true,
        isFavorite: Bool = true
    ) -> Self {
        .init(
            mediaURL: mediaURL,
            mediaType: mediaType,
            title: title,
            description: description,
            date: date,
            isHiddenNextButton: isHiddenNextButton,
            isFavorite: isFavorite
        )
    }
}
