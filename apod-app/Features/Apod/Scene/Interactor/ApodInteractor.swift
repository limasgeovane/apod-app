//
//  ApodInteractor.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import Foundation

protocol ApodInteractorLogic {
    func requestApod()
    func requestApod(date: Date)
    func requestFavoriteApod()
    func requestUnfavoriteApod()
    func requestPreviousApod()
    func requestNextApod()
}

final class ApodInteractor: ApodInteractorLogic {
    private var currentApodDate: Date?
    private var currentApod: Apod?
    
    private let favoriteApodRepository: FavoritesApodRepositoryLogic
    private let repository: ApodRepositoryLogic
    private let presenter: ApodPresenterLogic
    
    init(repository: ApodRepositoryLogic, favoriteApodRepository: FavoritesApodRepositoryLogic, presenter: ApodPresenterLogic) {
        self.repository = repository
        self.favoriteApodRepository = favoriteApodRepository
        self.presenter = presenter
    }
    
    func requestApod() {
        repository.fetchApod(
            date: currentApodDate?.toString ?? Date().toString
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let apod):
                self.currentApod = apod
                self.presenter.responseApod(
                    apod: apod,
                    isFavorite: self.favoriteApodRepository.isApodFavorite(date: apod.date)
                )
            case .failure:
                self.presenter.responseError()
            }
        }
    }
    
    func requestApod(date: Date) {
        currentApodDate = date
        requestApod()
    }
    
    func requestFavoriteApod() {
        if let apod = currentApod {
            let favoriteApod = FavoriteApod(date: apod.date, title: apod.title)
            favoriteApodRepository.saveFavorite(favoriteApod: favoriteApod)
        }
    }
    
    func requestUnfavoriteApod() {
        if let apod = currentApod {
            let favoriteApod = FavoriteApod(date: apod.date, title: apod.title)
            favoriteApodRepository.removeFavorite(favoriteApod: favoriteApod)
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
