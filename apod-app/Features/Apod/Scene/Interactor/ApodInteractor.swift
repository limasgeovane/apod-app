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
    func requestYesterdaysApod()
    func requestFavoriteApod()
    func requestUnfavoriteApod()
    func requestPreviousApod()
    func requestNextApod()
}

final class ApodInteractor {
    private var currentDate: Date?
    private var currentApod: Apod?
    
    private let favoriteApodsRepository: FavoriteApodsRepositoryLogic
    private let repository: ApodRepositoryLogic
    private let presenter: ApodPresenterLogic
    private let dateProvider: DateProvider
    
    init(
        repository: ApodRepositoryLogic,
        favoriteApodsRepository: FavoriteApodsRepositoryLogic,
        presenter: ApodPresenterLogic,
        dateProvider: DateProvider
    ) {
        self.repository = repository
        self.favoriteApodsRepository = favoriteApodsRepository
        self.presenter = presenter
        self.dateProvider = dateProvider
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func fetchApod(date: Date) {
        currentDate = date
        presenter.responseLoading()
        repository.fetchApod(
            date: date.toString
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let apod):
                self.currentApod = apod
                self.presenter.responseApod(
                    apod: apod,
                    isFavorite: self.favoriteApodsRepository.isApodFavorite(date: apod.date)
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

extension ApodInteractor: ApodInteractorLogic {
    func requestApod() {
        fetchApod(date: dateProvider.currentDate())
    }
    
    func requestApod(date: Date) {
        fetchApod(date: date)
    }
    
    func requestYesterdaysApod() {
        let previousDate = Calendar.current.date(
            byAdding: .day, value: -1, to: dateProvider.currentDate()
        )
        fetchApod(date: previousDate ?? dateProvider.currentDate())
    }
    
    func requestFavoriteApod() {
        if let apod = currentApod {
            let favoriteApod = FavoriteApod(date: apod.date, title: apod.title)
            favoriteApodsRepository.favorite(favoriteApod: favoriteApod)
        }
    }
    
    func requestUnfavoriteApod() {
        if let apod = currentApod {
            let favoriteApod = FavoriteApod(date: apod.date, title: apod.title)
            favoriteApodsRepository.unfavorite(favoriteApod: favoriteApod)
        }
    }
    
    func requestPreviousApod() {
        let previousDate = Calendar.current.date(
            byAdding: .day, value: -1, to: currentDate ?? dateProvider.currentDate()
        )
        fetchApod(date: previousDate ?? dateProvider.currentDate())
    }
    
    func requestNextApod() {
        let nextDate = Calendar.current.date(
            byAdding: .day, value: 1, to: currentDate ?? dateProvider.currentDate()
        )
        fetchApod(date: nextDate ?? dateProvider.currentDate())
    }
}
