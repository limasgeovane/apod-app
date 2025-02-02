//
//  ErrorView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import UIKit

final class ErrorView: UIView {
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⛈️"
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
        label.text = viewModel.errorMessage
        return label
    }()

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        button.setTitle(viewModel.actionTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .primary
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        return button
    }()
    
    private let viewModel: ErrorViewViewModel
    private let completionAction: (() -> Void)
    
    init(viewModel: ErrorViewViewModel, completionAction: @escaping (() -> Void)) {
        self.viewModel = viewModel
        self.completionAction = completionAction
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
        addSubview(actionButton)
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
            
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            actionButton.heightAnchor.constraint(equalToConstant: 40),
            actionButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -16)
        ])
    }

    @objc private func actionButtonPressed() {
        completionAction()
    }
}
