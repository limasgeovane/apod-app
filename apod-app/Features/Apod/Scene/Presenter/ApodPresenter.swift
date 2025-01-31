//
//  ApodPresenter.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

protocol ApodPresenterLogic {
    func responseApod(apod: Apod)
    func responseError()
}

final class ApodPresenter: ApodPresenterLogic {
    weak var display: ApodViewControllerLogic?
    
    func responseApod(apod: Apod) {
        let viewModel = ApodViewModel(
            mediaURL: apod.hdurl,
            title: apod.title,
            description: apod.explanation,
            date: apod.date.toFormattedDate
        )
        
        display?.displayApod(viewModel: viewModel)
    }
    
    func responseError() {
        
    }
}
