//
//  ApodFixture.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

extension Apod {
    static func fixture(
        title: String = "Apod title",
        date: String = "2025-02-02",
        explanation: String = "Apod explanation",
        hdurl: URL? = URL(string: "https://apod.hdurl.com"),
        url: URL? = URL(string: "https://apod.durl.com"),
        mediaType: Apod.MediaType = .image
    ) -> Self {
        .init(title: title, date: date, explanation: explanation, hdurl: hdurl, url: url, mediaType: .image)
    }
}
