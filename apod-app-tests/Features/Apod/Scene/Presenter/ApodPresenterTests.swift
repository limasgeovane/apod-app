//
//  ApodPresenterTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class ApodPresenterTests: XCTestCase {
    let viewControllerSpy = ApodViewControllerSpy()
    lazy var sut: ApodPresenter = {
        let presenter = ApodPresenter(
            dateProvider: DefaultDateProviderSpy()
        )
        presenter.display = viewControllerSpy
        return presenter
    }()
    
    func test_responseApod_shouldDisplayApodViewModel() {
        sut.responseApod(apod: .fixture(), isFavorite: true)
        
        XCTAssertEqual(viewControllerSpy.displayApodCount, 1)
        XCTAssertEqual(viewControllerSpy.displayApodParameterViewModel, .fixture())
    }
    
    func test_responseLoading_shouldDisplayLoading() {
        sut.responseLoading()
        
        XCTAssertEqual(viewControllerSpy.displayLoadingCount, 1)
    }
    
    func test_responseError_shouldDisplayError() {
        sut.responseError()
        
        XCTAssertEqual(viewControllerSpy.displayErrorCount, 1)
    }
}
