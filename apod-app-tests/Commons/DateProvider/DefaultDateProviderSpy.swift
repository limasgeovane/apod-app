//
//  Dat.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

@testable import apod_app
import Foundation

final class DefaultDateProviderSpy: DateProvider {
    var stubbedCurrentDateResult: Date?

    func currentDate() -> Date {
        return stubbedCurrentDateResult ?? "2025-02-02".toDate
    }
}
