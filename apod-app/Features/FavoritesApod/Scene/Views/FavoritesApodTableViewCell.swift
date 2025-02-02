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
        let image = UIImage.starFill.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    private let favoriteApodDateLabel: UILabel = {
        let label = UILabel()
        label.font = .primary
        return label
    }()
    
    private let favoriteApodTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .secondary
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
    
    func configureCell(viewModel: FavoritesApodViewModel) {
        favoriteApodDateLabel.text = viewModel.date
        favoriteApodTitleLabel.text = viewModel.title
    }
}
