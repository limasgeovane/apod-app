//
//  FavoritesApodTableViewCell.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

class FavoritesApodTableViewCell: UITableViewCell {
    static let identifier: String = "FavoritesApodTableViewCell"
    
    private let favoriteApodButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        return button
    }()
    
    private let favoriteApodDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2025-01-30"
        label.font = .primary
        return label
    }()
    
    private let favoriteApodTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .secondary
        label.text = "Hydrogen Clouds of M33"
        return label
    }()
    
    private lazy var favoriteStackViewVertical: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteApodDateLabel, favoriteApodTitleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var favoriteStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteApodButton, favoriteStackViewVertical])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(favoriteStackView)
    }
    
    private func setupViewAttributes() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            favoriteApodButton.widthAnchor.constraint(equalToConstant: 64),
        
            favoriteStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            favoriteStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            favoriteStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            favoriteStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
