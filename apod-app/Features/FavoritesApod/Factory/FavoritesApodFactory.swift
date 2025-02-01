//
//  FavoritesApodFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import UIKit

enum FavoritesApodFactory {
    static func make() -> UIViewController {
        return FavoritesApodViewController(contentView: FavoritesApodView())
    }
}
