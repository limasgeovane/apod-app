//
//  ViewControllerSnapshot.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import UIKit
@testable import apod_app

final class ViewControllerSnapshot: UIViewController {
    private let contentView: UIView
    private let handle: (() -> Void)?

    init(contentView: UIView, handle: (() -> Void)? = nil) {
        self.contentView = contentView
        self.handle = handle

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
        handle?()
    }

    private func setupViewHierarchy() {
        view.addSubview(contentView)
    }
    
    private func setupViewAttributes() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
