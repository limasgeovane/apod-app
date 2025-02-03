//
//  FavoritesApodInteractorTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class FavoritesApodInteractorTests: XCTestCase {
    let repositorySpy = FavoritesApodRepositorySpy()
    let presenterSpy = FavoritesApodPresenterSpy()
    
    lazy var sut = FavoritesApodInteractor(repository: repositorySpy, presenter: presenterSpy)
    
    func test_requestFavoritesApod_shouldResponseFavoritesApod() {
        repositorySpy.stubbedGetFavoritesResult = [.fixture()]
        sut.requestFavoritesApod()
        
        XCTAssertEqual(presenterSpy.responseFavoritesApodCount, 1)
        XCTAssertEqual(presenterSpy.responseFavoritesApodParameterFavoritesApod, [.fixture()])
    }
    
    func test_requestFavoritesApod_givenEmptyFavorites_shouldResponseEmptyState() {
        sut.requestFavoritesApod()
        
        XCTAssertEqual(presenterSpy.responseEmptyStateCount, 1)
    }
}
