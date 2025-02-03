//
//  ApodPresenterSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class ApodPresenterSpy: ApodPresenterLogic {
    private(set) var responseApodCount = 0
    private(set) var responseApodParameterApod: Apod?
    private(set) var responseApodParameterIsFavorite: Bool?

    func responseApod(apod: Apod, isFavorite: Bool) {
        responseApodCount += 1
        responseApodParameterApod = apod
        responseApodParameterIsFavorite = isFavorite
    }

    private(set) var responseLoadingCount = 0

    func responseLoading() {
        responseLoadingCount += 1
    }

    private(set) var responseErrorCount = 0

    func responseError() {
        responseErrorCount += 1
    }
}
