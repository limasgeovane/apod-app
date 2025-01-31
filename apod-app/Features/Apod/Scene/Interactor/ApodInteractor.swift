//
//  ApodInteractor.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import Foundation

protocol ApodInteractorLogic {
    func requestApod()
    func requestPreviousApod()
    func requestNextApod()
}

final class ApodInteractor: ApodInteractorLogic {
    private var currentApodDate: Date?
    
    private let repository: ApodRepositoryLogic
    private let presenter: ApodPresenterLogic
    
    init(repository: ApodRepositoryLogic, presenter: ApodPresenterLogic) {
        self.repository = repository
        self.presenter = presenter
    }
    
    func requestApod() {
        repository.fetchApod(
            date: currentApodDate?.formattedString ?? Date().formattedString
        ) { [weak self] result in
            switch result {
            case .success(let apod):
                self?.presenter.responseApod(apod: apod)
            case .failure:
                self?.presenter.responseError()
            }
        }
    }
    
    func requestPreviousApod() {
        let previousDay = Calendar.current.date(byAdding: .day, value: -1, to: currentApodDate ?? Date())
        currentApodDate = previousDay ?? Date()
        requestApod()
    }
    
    func requestNextApod() {
        let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentApodDate ?? Date())
        currentApodDate = nextDay ?? Date()
        requestApod()
    }
}
