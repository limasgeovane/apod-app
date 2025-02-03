//
//  FavoriteApodsViewController.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

protocol FavoriteApodsViewControllerLogic: AnyObject {
    func displayFavoriteApods(viewModel: [FavoriteApodsViewModel])
    func displayEmptyState()
}

class FavoriteApodsViewController: UIViewController {
    private let interactor: FavoriteApodsInteractorLogic
    private let contentView: FavoriteApodsViewLogic
    
    init(interactor: FavoriteApodsInteractorLogic, contentView: FavoriteApodsViewLogic) {
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
        interactor.requestFavoriteApods()
    }
}

extension FavoriteApodsViewController: FavoriteApodsViewControllerLogic {
    func displayFavoriteApods(viewModel: [FavoriteApodsViewModel]) {
        contentView.FavoriteApods = viewModel
        contentView.changeState(state: .content)
    }
    
    func displayEmptyState() {
        contentView.changeState(state: .empty)
    }
}

extension FavoriteApodsViewController: FavoriteApodsViewDelegate {
    func FavoriteApodsViewDidApodSelected(indexPath: IndexPath) {
        interactor.requestSelectFavoriteApod(indexPath: indexPath)
    }
}
