//
//  ApodViewControllerSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class ApodViewControllerSpy: ApodViewControllerLogic {
    private(set) var displayApodCount = 0
    private(set) var displayApodParameterViewModel: ApodViewModel?

    func displayApod(viewModel: ApodViewModel) {
        displayApodCount += 1
        displayApodParameterViewModel = viewModel
    }

    private(set) var displayLoadingCount = 0

    func displayLoading() {
        displayLoadingCount += 1
    }

    private(set) var displayErrorCount = 0

    func displayError() {
        displayErrorCount += 1
    }
}
