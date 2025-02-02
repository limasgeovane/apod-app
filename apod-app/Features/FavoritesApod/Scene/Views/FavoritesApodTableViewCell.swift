//
//  FavoritesApodTableViewCell.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

class FavoritesApodTableViewCell: UITableViewCell {
    static let identifier: String = "FavoritesApodTableViewCell"
    
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteApodDateLabel, favoriteApodTitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
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
        addSubview(stackView)
    }
    
    private func setupViewAttributes() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configureCell(viewModel: FavoritesApodViewModel) {
        favoriteApodDateLabel.text = viewModel.date
        favoriteApodTitleLabel.text = viewModel.title
    }
}
