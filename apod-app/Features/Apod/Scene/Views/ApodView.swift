//
//  ApodView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit
import Kingfisher

protocol ApodViewDelegate: AnyObject {
    func apodViewDidTapPrevious()
}

protocol ApodViewLogic: UIView {
    var delegate: ApodViewDelegate? { get set }
    func setupView(viewModel: ApodViewModel)
}

class ApodView: UIView {
    private let mediaView = ApodMediaView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .title
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description:"
        label.font = .primary
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .secondary
    //    textView.textAlignment = .justified
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    
    private let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date:"
        label.font = .primary
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        let stackView = UIStackView(arrangedSubviews: [dateTitleLabel, dateLabel, changeDateButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var apodStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [mediaView, titleLabel, descriptionTitleLabel, descriptionTextView, dateStackView]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(8, after: descriptionTitleLabel)
        stackView.setCustomSpacing(16, after: descriptionTextView)
        return stackView
    }()
    
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(previousButtonPressed), for: .touchUpInside)
        button.setTitle("Previous Apod", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .primary
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22
        return button
    }()
    
    weak var delegate: ApodViewDelegate?

    init() {
        super.init(frame: .zero)
        setupUI()
        setupUIConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(apodStackView)
        addSubview(previousButton)
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            apodStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            apodStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            apodStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            dateTitleLabel.widthAnchor.constraint(equalToConstant: 44),
            
            previousButton.heightAnchor.constraint(equalToConstant: 44),
            previousButton.topAnchor.constraint(equalTo: apodStackView.bottomAnchor, constant: 16),
            previousButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            previousButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            previousButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56)
        ])
    }
    
    @objc private func previousButtonPressed() {
        delegate?.apodViewDidTapPrevious()
    }
}

extension ApodView: ApodViewLogic {
    func setupView(viewModel: ApodViewModel) {
        mediaView.setup(url: viewModel.mediaURL, type: .image)
        titleLabel.text = viewModel.title
        descriptionTextView.text = viewModel.description
        dateLabel.text = viewModel.date
    }
}
