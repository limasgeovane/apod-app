//
//  ApodMediaProgressView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit
import Kingfisher

final class ApodMediaProgressView: UIView {
    var progress: Float = 0 {
        didSet {
            progressView.progress = progress
        }
    }
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading..."
        label.textAlignment = .center
        label.font = .primary
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(progressView)
        addSubview(loadingLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            progressView.heightAnchor.constraint(equalToConstant: 8),
            
            loadingLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 8),
            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
