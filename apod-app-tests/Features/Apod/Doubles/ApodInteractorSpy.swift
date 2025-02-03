//
//  ApodInteractorSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class ApodInteractorSpy: ApodInteractorLogic {
    private(set) var requestApodCount = 0

    func requestApod() {
        requestApodCount += 1
    }

    private(set) var requestApodDateCount = 0
    private(set) var requestApodDateParameterDate: Date?

    func requestApod(date: Date) {
        requestApodDateCount += 1
        requestApodDateParameterDate = date
    }

    private(set) var requestYesterdaysApodCount = 0

    func requestYesterdaysApod() {
        requestYesterdaysApodCount += 1
    }

    private(set) var requestFavoriteApodCount = 0

    func requestFavoriteApod() {
        requestFavoriteApodCount += 1
    }

    private(set) var requestUnfavoriteApodCount = 0

    func requestUnfavoriteApod() {
        requestUnfavoriteApodCount += 1
    }

    private(set) var requestPreviousApodCount = 0

    func requestPreviousApod() {
        requestPreviousApodCount += 1
    }

    private(set) var requestNextApodCount = 0

    func requestNextApod() {
        requestNextApodCount += 1
    }
}
