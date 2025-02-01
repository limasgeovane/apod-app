//
//  ApodViewController.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

protocol ApodViewControllerLogic: AnyObject {
    func displayApod(viewModel: ApodViewModel)
    func displayError()
}

class ApodViewController: UIViewController {
    private let interactor: ApodInteractorLogic
    private let contentView: ApodViewLogic
    
    init(interactor: ApodInteractorLogic, contentView: ApodViewLogic) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        interactor.requestApod()
    }
    
    private func setupNavigation() {
        let favoriteButton = UIBarButtonItem(
            image: UIImage(systemName: "star"),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem = favoriteButton
    }
}

extension ApodViewController: ApodViewControllerLogic {
    func displayApod(viewModel: ApodViewModel) {
        contentView.setupView(viewModel: viewModel)
    }
    
    func displayError() {
        
    }
}

extension ApodViewController: ApodViewDelegate {
    func apodViewPreviousPressed() {
        interactor.requestPreviousApod()
    }
    
    func apodViewNextPressed() {
        interactor.requestNextApod()
    }
    
    func apodViewDateValueChanged(date: Date) {
        interactor.requestApod(date: date)
    }
}
