//
//  FavoriteApodsInteractorSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class FavoriteApodsInteractorSpy: FavoriteApodsInteractorLogic {
    private(set) var requestFavoriteApodsCount = 0

    func requestFavoriteApods() {
        requestFavoriteApodsCount += 1
    }

    private(set) var requestSelectFavoriteApodCount = 0
    private(set) var requestSelectFavoriteApodParameterIndexPath: IndexPath?

    func requestSelectFavoriteApod(indexPath: IndexPath) {
        requestSelectFavoriteApodCount += 1
        requestSelectFavoriteApodParameterIndexPath = indexPath
    }
}
