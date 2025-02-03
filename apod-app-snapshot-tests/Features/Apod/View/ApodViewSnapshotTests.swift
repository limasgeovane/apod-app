//
//  ApodViewSnapshotTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import SnapshotTesting
import XCTest
@testable import apod_app

final class ApodViewSnapshotTests: XCTestCase {
    private let sut = ApodView()
    
    func test_view_givenContentState_shouldCorretLayout() {
        let viewControllerSnapshot = ViewControllerSnapshot(contentView: sut) {
            self.sut.setupContent(viewModel: .fixture())
            self.sut.changeState(state: .content)
        }
        assertSnapshot(of: viewControllerSnapshot, as: .image(on: .iPhone13Pro(.portrait)))
    }
    
    func test_view_givenContentState_givenShowNextButton_shouldCorretLayout() {
        let viewControllerSnapshot = ViewControllerSnapshot(contentView: sut) {
            self.sut.setupContent(viewModel: .fixture(isHiddenNextButton: false))
            self.sut.changeState(state: .content)
        }
        assertSnapshot(of: viewControllerSnapshot, as: .image(on: .iPhone13Pro(.portrait)))
    }
    
    func test_view_givenLoadingState_shouldCorretLayout() {
        let viewControllerSnapshot = ViewControllerSnapshot(contentView: sut) {
            self.sut.changeState(state: .loading)
        }
        assertSnapshot(of: viewControllerSnapshot, as: .image(on: .iPhone13Pro(.portrait)))
    }
    
    func test_view_givenErrorState_shouldCorretLayout() {
        let viewControllerSnapshot = ViewControllerSnapshot(contentView: sut) {
            self.sut.changeState(state: .error)
        }
        assertSnapshot(of: viewControllerSnapshot, as: .image(on: .iPhone13Pro(.portrait)))
    }
}
