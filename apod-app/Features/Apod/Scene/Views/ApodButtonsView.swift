//
//  ApodButtonsView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit

protocol ApodButtonsViewDelegate: AnyObject {
    func apodViewDidTapPrevious()
    func apodViewDidTapNext()
}

class ApodButtonsView: UIView {
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(previousButtonPressed), for: .touchUpInside)
        button.setTitle("Previous apod", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .primary
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        button.setTitle("Next apod", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .primary
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [previousButton, nextButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    weak var delegate: ApodButtonsViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(stackView)
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func previousButtonPressed() {
        delegate?.apodViewDidTapPrevious()
    }
    
    @objc private func nextButtonPressed() {
        delegate?.apodViewDidTapNext()
    }
}
