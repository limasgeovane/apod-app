//
//  EmptyStateView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import UIKit

final class EmptyStateView: UIView {
    private lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.emoji
        label.font = .title
        label.textAlignment = .center
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .primary
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = viewModel.message
        return label
    }()

    private let viewModel: EmptyStateViewModel
    
    init(viewModel: EmptyStateViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {
        addSubview(emojiLabel)
        addSubview(messageLabel)
    }
    
    private func setupViewAttributes() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emojiLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -24),
            
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
        ])
    }
}
