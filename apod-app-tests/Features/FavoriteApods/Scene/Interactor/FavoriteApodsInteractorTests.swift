//
//  FavoriteApodsInteractorTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class FavoriteApodsInteractorTests: XCTestCase {
    let repositorySpy = FavoriteApodsRepositorySpy()
    let presenterSpy = FavoriteApodsPresenterSpy()
    
    lazy var sut = FavoriteApodsInteractor(repository: repositorySpy, presenter: presenterSpy)
    
    func test_requestFavoriteApods_shouldResponseFavoriteApods() {
        repositorySpy.stubbedGetFavoritesResult = [.fixture()]
        sut.requestFavoriteApods()
        
        XCTAssertEqual(presenterSpy.responseFavoriteApodsCount, 1)
        XCTAssertEqual(presenterSpy.responseFavoriteApodsParameterFavoriteApods, [.fixture()])
    }
    
    func test_requestFavoriteApods_givenEmptyFavorites_shouldResponseEmptyState() {
        sut.requestFavoriteApods()
        
        XCTAssertEqual(presenterSpy.responseEmptyStateCount, 1)
    }
}
