//
//  FavoritesApodViewController.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

protocol FavoritesApodViewControllerLogic: AnyObject {
    func displayFavoritesApod(viewModel: [FavoritesApodViewModel])
    func displayEmptyState()
}

class FavoritesApodViewController: UIViewController {
    private let interactor: FavoritesApodInteractorLogic
    private let contentView: FavoritesApodViewLogic
    
    init(interactor: FavoritesApodInteractorLogic, contentView: FavoritesApodViewLogic) {
        self.interactor = interactor
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
        contentView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.requestFavoritesApod()
    }
}

extension FavoritesApodViewController: FavoritesApodViewControllerLogic {
    func displayFavoritesApod(viewModel: [FavoritesApodViewModel]) {
        contentView.favoritesApod = viewModel
        contentView.changeState(state: .content)
    }
    
    func displayEmptyState() {
        contentView.changeState(state: .empty)
    }
}

extension FavoritesApodViewController: FavoritesApodViewDelegate {
    func favoritesApodViewDidApodSelected(indexPath: IndexPath) {
        interactor.requestSelectFavoriteApod(indexPath: indexPath)
    }
}
