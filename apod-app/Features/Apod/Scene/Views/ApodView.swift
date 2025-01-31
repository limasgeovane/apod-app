//
//  ApodView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

protocol ApodViewLogic: AnyObject, UIView {
    var apod: ApodViewModel { get set }
}

class ApodView: UIView {
    private let apodImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "apodImageTest")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let apodTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hydrogen Clouds of M33"
        label.font = .title
        return label
    }()
    
    private let apodDescriptionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description:"
        label.font = .primary
        return label
    }()
    
    private let apodDescription: UITextView = {
        let textView = UITextView()
        textView.text = "Gorgeous spiral galaxy Messier 33 seems to have more than its fair share of glowing hydrogen gas. A prominent member of the local group of galaxies, M33 is also known as the Triangulum Galaxy and lies a mere 3 million light-years away.  The galaxy's central 60,000 light-years or so are shown in this sharp galaxy portrait. The portrait features M33's reddish ionized hydrogen clouds or HII regions. Sprawling along loose spiral arms that wind toward the core, M33's giant HII regions are some of the largest known stellar nurseries, sites of the formation of short-lived but very massive stars. Intense ultraviolet radiation from the luminous, massive stars ionizes the surrounding hydrogen gas and ultimately produces the characteristic red glow. In this image, broadband data were combined with narrowband data recorded through a filter that transmits the light of the strongest visible hydrogen and oxygen emission lines."
        textView.font = .secondary
        textView.textAlignment = .justified
        return textView
    }()
    
    private let apodDateTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date:"
        label.font = .primary
        return label
    }()
    
    private let apodDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2025-01-30"
        label.font = .secondary
        return label
    }()
    
    private let changeDateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Date", for: .normal)
        button.titleLabel?.font = .primary
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [apodDateTitle, apodDate, changeDateButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var apodStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [apodImage, apodTitle, apodDescriptionTitle, apodDescription, dateStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(0, after: apodDescriptionTitle)
        stackView.setCustomSpacing(16, after: apodDescription)
        return stackView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous Apod", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .primary
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(apodStackView)
        addSubview(previousButton)
        setupUIConstraints()
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            apodStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            apodStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            apodStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            apodImage.heightAnchor.constraint(equalToConstant: 300),
            
            apodDateTitle.widthAnchor.constraint(equalToConstant: 50),
            
            previousButton.heightAnchor.constraint(equalToConstant: 44),
            previousButton.topAnchor.constraint(equalTo: apodStackView.bottomAnchor, constant: 16),
            previousButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            previousButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            previousButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56)
        ])
    }
}
