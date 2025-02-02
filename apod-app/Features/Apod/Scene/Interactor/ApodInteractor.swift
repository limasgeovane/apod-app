//
//  ApodInteractor.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import Foundation

protocol ApodInteractorLogic {
    func requestApod(date: Date)
    func requestFavoriteApod()
    func requestUnfavoriteApod()
    func requestPreviousApod()
    func requestNextApod()
}

final class ApodInteractor: ApodInteractorLogic {
    private var currentApod: Apod?
    
    private let favoriteApodRepository: FavoritesApodRepositoryLogic
    private let repository: ApodRepositoryLogic
    private let presenter: ApodPresenterLogic
    
    init(repository: ApodRepositoryLogic, favoriteApodRepository: FavoritesApodRepositoryLogic, presenter: ApodPresenterLogic) {
        self.repository = repository
        self.favoriteApodRepository = favoriteApodRepository
        self.presenter = presenter
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func requestApod(date: Date) {
        fetchApod(date: date)
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
        let previousDate = Calendar.current.date(
            byAdding: .day, value: -1, to: currentApod?.date.toDate ?? Date()
        )
        fetchApod(date: previousDate ?? Date())
    }
    
    func requestNextApod() {
        let nextDate = Calendar.current.date(
            byAdding: .day, value: 1, to: currentApod?.date.toDate ?? Date()
        )
        fetchApod(date: nextDate ?? Date())
    }
    
    private func fetchApod(date: Date) {
        repository.fetchApod(
            date: date.toString
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
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(favoriteApodSelected),
            name: .favoriteApodSelected,
            object: nil
        )
    }
    
    @objc private func favoriteApodSelected(notification: Notification) {
        if let userInfo = notification.userInfo,
           let favoriteApod = userInfo["apodDate"] as? String {
            requestApod(date: favoriteApod.toDate)
        }
    }
}
