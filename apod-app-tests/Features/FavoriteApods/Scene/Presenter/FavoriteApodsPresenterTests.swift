//
//  FavoriteApodsPresenterTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class FavoriteApodsPresenterTests: XCTestCase {
    let viewControllerSpy = FavoriteApodsViewControllerSpy()
    
    lazy var sut: FavoriteApodsPresenter = {
        let presenter = FavoriteApodsPresenter()
        presenter.display = viewControllerSpy
        return presenter
    }()
    
    func test_responseFavoriteApods_shouldDisplayFavoriteApods() {
        sut.responseFavoriteApods(FavoriteApods: [.fixture()])
        
        XCTAssertEqual(viewControllerSpy.displayFavoriteApodsCount, 1)
        XCTAssertEqual(viewControllerSpy.displayFavoriteApodsParameterViewModel, [.fixture()])
    }
    
    func test_responseEmptyState_shouldDisplayEmptyState() {
        sut.responseEmptyState()
        
        XCTAssertEqual(viewControllerSpy.displayEmptyStateCount, 1)
    }
}
