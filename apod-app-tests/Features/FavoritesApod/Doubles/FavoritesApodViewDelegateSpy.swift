//
//  FavoritesApodViewDelegateSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class FavoritesApodViewDelegateSpy: FavoritesApodViewDelegate {
    private(set) var favoritesApodViewDidApodSelectedCount = 0
    private(set) var favoritesApodViewDidApodSelectedParameterIndexPath: IndexPath?

    func favoritesApodViewDidApodSelected(indexPath: IndexPath) {
        favoritesApodViewDidApodSelectedCount += 1
        favoritesApodViewDidApodSelectedParameterIndexPath = indexPath
    }
}
