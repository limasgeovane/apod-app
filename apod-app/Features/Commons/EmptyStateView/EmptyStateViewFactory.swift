//
//  EmptyStateViewFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import UIKit

enum EmptyStateViewFactory {
    static func makeFavoritesEmptyState() -> EmptyStateView {
        let viewModel = EmptyStateViewModel(
            emoji: "❄️",
            message: Strings.favoritesEmptyMessage
        )
        let view = EmptyStateView(viewModel: viewModel)
        return view
    }
}
