//
//  FavoriteApodsViewDelegateSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class FavoriteApodsViewDelegateSpy: FavoriteApodsViewDelegate {
    private(set) var favoriteApodsViewDidApodSelectedCount = 0
    private(set) var favoriteApodsViewDidApodSelectedParameterIndexPath: IndexPath?

    func favoriteApodsViewDidApodSelected(indexPath: IndexPath) {
        favoriteApodsViewDidApodSelectedCount += 1
        favoriteApodsViewDidApodSelectedParameterIndexPath = indexPath
    }
}
