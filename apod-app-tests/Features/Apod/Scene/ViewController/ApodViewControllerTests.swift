//
//  ApodViewControllerTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import XCTest
@testable import apod_app

final class ApodViewControllerTests: XCTestCase {
    let interactorSpy = ApodInteractorSpy()
    let contentViewSpy = ApodViewSpy()
    
    lazy var sut = ApodViewController(interactor: interactorSpy, contentView: contentViewSpy)
    
    func test_loadView_shouldSetView() {
        sut.loadView()
        
        XCTAssertTrue(sut.view is ApodViewLogic)
        XCTAssertEqual(contentViewSpy.delegateSetterCount, 1)
    }
    
    func test_viewDidLoad_shouldCallFetchArtists() {
        sut.viewDidLoad()
        
        XCTAssertEqual(interactorSpy.requestApodCount, 1)
    }
    
    func test_displayApod_shouldChangeToContentState() {
        sut.displayApod(viewModel: .fixture())
        
        XCTAssertEqual(contentViewSpy.setupContentCount, 1)
        XCTAssertEqual(contentViewSpy.setupContentParameterViewModel, .fixture())
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .content)
    }
    
    func test_displayLoading_shouldChangeToLoadingState() {
        sut.displayLoading()
        
        XCTAssertNil(sut.navigationItem.rightBarButtonItem?.image)
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .loading)
    }
    
    func test_displayError_shouldChangeToErrorState() {
        sut.displayError()
        
        XCTAssertNil(sut.navigationItem.rightBarButtonItem?.image)
        XCTAssertEqual(contentViewSpy.changeStateCount, 1)
        XCTAssertEqual(contentViewSpy.changeStateParameterState, .error)
    }
    
    func test_apodViewPreviousPressed_shouldRequestPreviousApod() {
        sut.apodViewPreviousPressed()
        
        XCTAssertEqual(interactorSpy.requestPreviousApodCount, 1)
    }
    
    func test_apodViewNextPressed_shouldRequestNextApod() {
        sut.apodViewNextPressed()
        
        XCTAssertEqual(interactorSpy.requestNextApodCount, 1)
    }
    
    func test_apodViewDateValueChanged_shouldRequestApodWithDate() {
        sut.apodViewDateValueChanged(date: "2023-08-01".toDate)
        
        XCTAssertEqual(interactorSpy.requestApodDateCount, 1)
        XCTAssertEqual(interactorSpy.requestApodDateParameterDate, "2023-08-01".toDate)
    }
    
    func test_apodViewErrorActionPressed_shouldRequestYesterdaysApod() {
        sut.apodViewErrorActionPressed()
        
        XCTAssertEqual(interactorSpy.requestYesterdaysApodCount, 1)
    }
}
