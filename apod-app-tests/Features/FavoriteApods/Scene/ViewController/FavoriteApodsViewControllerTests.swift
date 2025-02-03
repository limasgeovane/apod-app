//
//  FavoriteApodsViewControllerTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class FavoriteApodsViewControllerTests: XCTestCase {
    let interactorSpy = FavoriteApodsInteractorSpy()
    let contentViewSpy = FavoriteApodsViewSpy()
    
    lazy var sut = FavoriteApodsViewController(interactor: interactorSpy, contentView: contentViewSpy)
    
    func test_loadView_shouldSetView() {
        sut.loadView()
        
        XCTAssertTrue(sut.view is FavoriteApodsViewLogic)
        XCTAssertEqual(contentViewSpy.delegateSetterCount, 1)
    }
    
    func test_viewWillAppear_shouldRequestFavoriteApods() {
        sut.viewWillAppear(false)
        
        XCTAssertEqual(interactorSpy.requestFavoriteApodsCount, 1)
    }
    
    func test_displayFavoriteApods_shouldChangeStateToContent() {
        sut.displayFavoriteApods(viewModel: [.fixture()])
        
        XCTAssertEqual(contentViewSpy.invokedFavoriteApods, [.fixture()])
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .content)
    }
    
    func test_displayEmptyState_shouldChangeStateToEmpty() {
        sut.displayEmptyState()
        
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .empty)
    }
    
    func test_FavoriteApodsViewDidApodSelected_shoudlRequestSelectFavoriteApod() {
        sut.favoriteApodsViewDidApodSelected(indexPath: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(interactorSpy.requestSelectFavoriteApodCount, 1)
        XCTAssertEqual(interactorSpy.requestSelectFavoriteApodParameterIndexPath, IndexPath(row: 0, section: 0))
    }
}
