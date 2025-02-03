//
//  FavoriteApodsViewDelegateSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class FavoriteApodsViewDelegateSpy: FavoriteApodsViewDelegate {
    private(set) var FavoriteApodsViewDidApodSelectedCount = 0
    private(set) var FavoriteApodsViewDidApodSelectedParameterIndexPath: IndexPath?

    func FavoriteApodsViewDidApodSelected(indexPath: IndexPath) {
        FavoriteApodsViewDidApodSelectedCount += 1
        FavoriteApodsViewDidApodSelectedParameterIndexPath = indexPath
    }
}
