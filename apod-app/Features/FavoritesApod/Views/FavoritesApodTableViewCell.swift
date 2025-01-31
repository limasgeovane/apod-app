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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        return button
    }()
    
    private let favoriteApodDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2025-01-30"
        label.font = .primary
        return label
    }()
    
    private let favoriteApodTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .secondary
        label.text = "Hydrogen Clouds of M33"
        return label
    }()
    
    private lazy var favoriteStackViewVertical: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteApodDateLabel, favoriteApodTitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var favoriteStackViewHorizontal: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteApodButton, favoriteStackViewVertical])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        //stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(favoriteStackViewHorizontal)
        setupUIConstraints()
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            favoriteApodButton.widthAnchor.constraint(equalToConstant: 64),
        
            favoriteStackViewHorizontal.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            favoriteStackViewHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            favoriteStackViewHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            favoriteStackViewHorizontal.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
