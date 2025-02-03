//
//  FavoriteApodsViewSnapshotTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//


import SnapshotTesting
import XCTest
@testable import apod_app

final class FavoriteApodsViewSnapshotTests: XCTestCase {
    private let sut = FavoriteApodsView()

    func test_view_givenContentState_shouldCorretLayout() {
        let viewControllerSnapshot = ViewControllerSnapshot(contentView: sut) {
            self.sut.favoriteApods = [.fixture(), .fixture(), .fixture(), .fixture(), .fixture()]
            self.sut.changeState(state: .content)
        }
        assertSnapshot(of: viewControllerSnapshot, as: .image(on: .iPhone13Pro(.portrait)))
    }
    
    func test_view_givenEmptyState_shouldCorretLayout() {
        let viewControllerSnapshot = ViewControllerSnapshot(contentView: sut) {
            self.sut.changeState(state: .empty)
        }
        assertSnapshot(of: viewControllerSnapshot, as: .image(on: .iPhone13Pro(.portrait)))
    }
}
