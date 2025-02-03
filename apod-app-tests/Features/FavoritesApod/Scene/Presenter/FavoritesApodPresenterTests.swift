//
//  FavoritesApodPresenterTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class FavoritesApodPresenterTests: XCTestCase {
    let viewControllerSpy = FavoritesApodViewControllerSpy()
    
    lazy var sut: FavoritesApodPresenter = {
        let presenter = FavoritesApodPresenter()
        presenter.display = viewControllerSpy
        return presenter
    }()
    
    func test_responseFavoritesApod_shouldDisplayFavoritesApod() {
        sut.responseFavoritesApod(favoritesApod: [.fixture()])
        
        XCTAssertEqual(viewControllerSpy.displayFavoritesApodCount, 1)
        XCTAssertEqual(viewControllerSpy.displayFavoritesApodParameterViewModel, [.fixture()])
    }
    
    func test_responseEmptyState_shouldDisplayEmptyState() {
        sut.responseEmptyState()
        
        XCTAssertEqual(viewControllerSpy.displayEmptyStateCount, 1)
    }
}
