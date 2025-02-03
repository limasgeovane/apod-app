//
//  FavoriteApodsView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

protocol FavoriteApodsViewDelegate: AnyObject {
    func FavoriteApodsViewDidApodSelected(indexPath: IndexPath)
}

protocol FavoriteApodsViewLogic: UIView, AnyObject {
    var delegate: FavoriteApodsViewDelegate? { get set }
    var FavoriteApods: [FavoriteApodsViewModel] { get set }
    func changeState(state: FavoriteApodsView.State)
}

class FavoriteApodsView: UIView, FavoriteApodsViewLogic {
    enum State {
        case content
        case empty
    }
    
    weak var delegate: FavoriteApodsViewDelegate?
    
    var FavoriteApods: [FavoriteApodsViewModel] = [] {
        didSet {
            FavoriteApodsTableView.reloadData()
        }
    }
    
    private lazy var FavoriteApodsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoriteApodsTableViewCell.self, forCellReuseIdentifier: FavoriteApodsTableViewCell.identifier)
        tableView.backgroundColor = .systemBackground
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let emptyStateView: EmptyStateView = {
        let view = EmptyStateViewFactory.makeFavoritesEmptyState()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    func changeState(state: State) {
        switch state {
        case .content:
            emptyStateView.isHidden = true
        case .empty:
            emptyStateView.isHidden = false
        }
    }
    
    private func setupViewHierarchy() {
        addSubview(FavoriteApodsTableView)
        addSubview(emptyStateView)
    }
    
    private func setupViewAttributes() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            FavoriteApodsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            FavoriteApodsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            FavoriteApodsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            FavoriteApodsTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56),
            
            emptyStateView.topAnchor.constraint(equalTo: topAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyStateView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyStateView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension FavoriteApodsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        84
    }
}

extension FavoriteApodsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        FavoriteApods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteApodsTableViewCell.identifier, for: indexPath) as? FavoriteApodsTableViewCell else {
            return UITableViewCell()
        }
        let favoriteApod = FavoriteApods[indexPath.row]
        cell.configureCell(viewModel: favoriteApod)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.FavoriteApodsViewDidApodSelected(indexPath: indexPath)
    }
}
