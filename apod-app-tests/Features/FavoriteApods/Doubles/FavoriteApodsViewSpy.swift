//
//  FavoriteApodsViewSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import UIKit

final class FavoriteApodsViewSpy: UIView, FavoriteApodsViewLogic {
    private(set) var delegateGetterCount = 0
    var stubbedDelegate: FavoriteApodsViewDelegate?
    private(set) var delegateSetterCount = 0
    private(set) var invokedDelegate: FavoriteApodsViewDelegate?

    var delegate: FavoriteApodsViewDelegate? {
        get {
            delegateGetterCount += 1
            return stubbedDelegate
        }
        set {
            delegateSetterCount += 1
            invokedDelegate = newValue
        }
    }
    
    private(set) var favoriteApodsGetterCount = 0
    var stubbedFavoriteApods: [FavoriteApodsViewModel] = []
    private(set) var favoriteApodsSetterCount = 0
    private(set) var invokedFavoriteApods: [FavoriteApodsViewModel] = []

    var favoriteApods: [FavoriteApodsViewModel] {
        get {
            favoriteApodsGetterCount += 1
            return stubbedFavoriteApods
        }
        set {
            favoriteApodsSetterCount += 1
            invokedFavoriteApods = newValue
        }
    }

    private(set) var changeStateCount = 0
    private(set) var changeStateParameterState: FavoriteApodsView.State?

    func changeState(state: FavoriteApodsView.State) {
        changeStateCount += 1
        changeStateParameterState = state
    }
}
