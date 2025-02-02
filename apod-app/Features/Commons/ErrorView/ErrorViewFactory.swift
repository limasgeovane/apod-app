//
//  ErrorViewFactory.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import UIKit

enum ErrorViewFactory {
    static func makeApodError(completionAction: @escaping (() -> Void)) -> ErrorView {
        let viewModel = ErrorViewViewModel(
            emoji: "⛈️",
            errorMessage: Strings.apodErrorMessage,
            actionTitle: Strings.apodErrorAction
        )
        let view = ErrorView(viewModel: viewModel, completionAction: completionAction)
        return view
    }
}
