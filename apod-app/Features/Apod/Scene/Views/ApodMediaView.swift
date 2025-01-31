//
//  ApodMediaView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit
import Kingfisher

final class ApodMediaView: UIView {
    private let mediaProgressView = ApodMediaProgressView()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mediaProgressView, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(url: URL, type: Apod.MediaType) {
        imageView.isHidden = true
        mediaProgressView.isHidden = false
        
        imageView.kf.setImage(with: url) { [weak self] receivedSize, totalSize in
            let progress = Float(receivedSize) / Float(totalSize)
            self?.mediaProgressView.progress = progress
        } completionHandler: { [weak self] result in
            switch result {
            case .success:
                self?.mediaProgressView.isHidden = true
                self?.imageView.isHidden = false
            case .failure:
                self?.mediaProgressView.isHidden = true
                self?.imageView.isHidden = false
                self?.imageView.image = UIImage.imageError
            }
        }
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
            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
