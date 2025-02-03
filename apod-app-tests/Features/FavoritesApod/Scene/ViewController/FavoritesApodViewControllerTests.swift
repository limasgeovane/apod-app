//
//  FavoritesApodViewControllerTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class FavoritesApodViewControllerTests: XCTestCase {
    let interactorSpy = FavoritesApodInteractorSpy()
    let contentViewSpy = FavoritesApodViewSpy()
    
    lazy var sut = FavoritesApodViewController(interactor: interactorSpy, contentView: contentViewSpy)
    
    func test_loadView_shouldSetView() {
        sut.loadView()
        
        XCTAssertTrue(sut.view is FavoritesApodViewLogic)
        XCTAssertEqual(contentViewSpy.delegateSetterCount, 1)
    }
    
    func test_viewWillAppear_shouldRequestFavoritesApod() {
        sut.viewWillAppear(false)
        
        XCTAssertEqual(interactorSpy.requestFavoritesApodCount, 1)
    }
    
    func test_displayFavoritesApod_shouldChangeStateToContent() {
        sut.displayFavoritesApod(viewModel: [.fixture()])
        
        XCTAssertEqual(contentViewSpy.invokedFavoritesApod, [.fixture()])
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .content)
    }
    
    func test_displayEmptyState_shouldChangeStateToEmpty() {
        sut.displayEmptyState()
        
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .empty)
    }
    
    func test_favoritesApodViewDidApodSelected_shoudlRequestSelectFavoriteApod() {
        sut.favoritesApodViewDidApodSelected(indexPath: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(interactorSpy.requestSelectFavoriteApodCount, 1)
        XCTAssertEqual(interactorSpy.requestSelectFavoriteApodParameterIndexPath, IndexPath(row: 0, section: 0))
    }
}
