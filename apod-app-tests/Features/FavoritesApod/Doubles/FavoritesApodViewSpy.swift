//
//  FavoritesApodViewSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import UIKit

final class FavoritesApodViewSpy: UIView, FavoritesApodViewLogic {
    private(set) var delegateGetterCount = 0
    var stubbedDelegate: FavoritesApodViewDelegate?
    private(set) var delegateSetterCount = 0
    private(set) var invokedDelegate: FavoritesApodViewDelegate?

    var delegate: FavoritesApodViewDelegate? {
        get {
            delegateGetterCount += 1
            return stubbedDelegate
        }
        set {
            delegateSetterCount += 1
            invokedDelegate = newValue
        }
    }
    
    private(set) var favoritesApodGetterCount = 0
    var stubbedFavoritesApod: [FavoritesApodViewModel] = []
    private(set) var favoritesApodSetterCount = 0
    private(set) var invokedFavoritesApod: [FavoritesApodViewModel] = []

    var favoritesApod: [FavoritesApodViewModel] {
        get {
            favoritesApodGetterCount += 1
            return stubbedFavoritesApod
        }
        set {
            favoritesApodSetterCount += 1
            invokedFavoritesApod = newValue
        }
    }

    private(set) var changeStateCount = 0
    private(set) var changeStateParameterState: FavoritesApodView.State?

    func changeState(state: FavoritesApodView.State) {
        changeStateCount += 1
        changeStateParameterState = state
    }
}
