//
//  FavoritesApodView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

protocol FavoritesApodViewLogic: UIView, AnyObject {
    var favoritesApod: [FavoritesApodViewModel] { get set }
}

class FavoritesApodView: UIView, FavoritesApodViewLogic {
    var favoritesApod: [FavoritesApodViewModel] = [] {
        didSet {
            favoritesApodTableView.reloadData()
        }
    }
    
    private lazy var favoritesApodTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoritesApodTableViewCell.self, forCellReuseIdentifier: FavoritesApodTableViewCell.identifier)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(favoritesApodTableView)
    }
    
    private func setupViewAttributes() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            favoritesApodTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            favoritesApodTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            favoritesApodTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            favoritesApodTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56)
        ])
    }
}

extension FavoritesApodView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        84
    }
}

extension FavoritesApodView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesApod.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesApodTableViewCell.identifier, for: indexPath) as? FavoritesApodTableViewCell else {
            return UITableViewCell()
        }
        let favoriteApod = favoritesApod[indexPath.row]
        cell.configureCell(viewModel: favoriteApod)
        return cell
    }
}
