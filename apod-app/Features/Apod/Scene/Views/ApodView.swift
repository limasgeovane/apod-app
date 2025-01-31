//
//  ApodView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit
import Kingfisher

protocol ApodViewLogic: UIView {
    var delegate: ApodButtonsViewDelegate? { get set }
    func setupView(viewModel: ApodViewModel)
}

class ApodView: UIView {
    private let mediaView = ApodMediaView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description:"
        label.font = .primary
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .secondary
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    
    private let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Date:"
        label.font = .primary
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .secondary
        return label
    }()
    
    private let changeDateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change date", for: .normal)
        button.titleLabel?.font = .primary
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateTitleLabel, dateLabel, changeDateButton])
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
    
    private let apodButtonsView: ApodButtonsView = {
        let view = ApodButtonsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: ApodButtonsViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupUI()
        setupUIConstraints()
        apodButtonsView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNextButtonVisibility() {
        apodButtonsView.nextButton.isHidden = dateLabel.text == Date().formattedStringBR
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        apodButtonsView.nextButton.isHidden = true
        addSubview(apodStackView)
        addSubview(apodButtonsView)
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            apodStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            apodStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            apodStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            dateTitleLabel.widthAnchor.constraint(equalToConstant: 44),
            
            apodButtonsView.topAnchor.constraint(equalTo: apodStackView.bottomAnchor, constant: 16),
            apodButtonsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            apodButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            apodButtonsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56)
        ])
    }
}

extension ApodView: ApodViewLogic {
    func setupView(viewModel: ApodViewModel) {
        mediaView.setup(url: viewModel.mediaURL, type: .image)
        titleLabel.text = viewModel.title
        descriptionTextView.text = viewModel.description
        dateLabel.text = viewModel.date
        setupNextButtonVisibility()
    }
}

extension ApodView: ApodButtonsViewDelegate {
    func apodViewDidTapPrevious() {
        delegate?.apodViewDidTapPrevious()
        setupNextButtonVisibility()
    }
    
    func apodViewDidTapNext() {
        delegate?.apodViewDidTapNext()
    }
}
