//
//  ApodMediaView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

final class ApodMediaView: UIView {
    private let mediaProgressView = ApodMediaProgressView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private let indicatorView = UIActivityIndicatorView()
    
    private let videoPlayerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.isHidden = true
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mediaProgressView, imageView, indicatorView, videoPlayerView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(url: URL, type: Apod.MediaType) {
        switch type {
        case .image:
            imageView.isHidden = true
            mediaProgressView.isHidden = false
            videoPlayerView.isHidden = true
            indicatorView.isHidden = true
            loadImage(url: url)
        case .video:
            imageView.isHidden = true
            mediaProgressView.isHidden = true
            videoPlayerView.isHidden = true
            indicatorView.isHidden = false
            indicatorView.startAnimating()
            loadVideo(url: url)
        }
    }
    
    private func loadImage(url: URL) {
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
    
    private func loadVideo(url: URL) {
        if let videoID = url.youtubeVideoID {
            let youtubePlayerView = YTPlayerView(frame: bounds)
            youtubePlayerView.delegate = self
            videoPlayerView.addSubview(youtubePlayerView)
            
            youtubePlayerView.load(withVideoId: videoID)
        }
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
            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension ApodMediaView: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        indicatorView.isHidden = true
        indicatorView.stopAnimating()
        videoPlayerView.isHidden = false
        playerView.playVideo()
    }
}
