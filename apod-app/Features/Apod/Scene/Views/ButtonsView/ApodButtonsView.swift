//
//  ApodButtonsView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit

protocol ApodButtonsViewDelegate: AnyObject {
    func apodButtonsViewPreviousPressed()
    func apodButtonsViewViewNextPressed()
}

final class ApodButtonsView: UIView {
    var isHiddenNextButton: Bool = false {
        didSet {
            nextButton.isHidden = isHiddenNextButton
        }
    }
    
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
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        button.setTitle("Next apod", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .primary
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        button.isHidden = true
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
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(stackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func previousButtonPressed() {
        delegate?.apodButtonsViewPreviousPressed()
    }
    
    @objc private func nextButtonPressed() {
        delegate?.apodButtonsViewViewNextPressed()
    }
}
