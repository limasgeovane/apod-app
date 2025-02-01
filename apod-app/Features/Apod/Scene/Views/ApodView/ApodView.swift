//
//  ApodView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit
import Kingfisher

protocol ApodViewDelegate: AnyObject {
    func apodViewChangeDatePressed()
    func apodViewPreviousPressed()
    func apodViewNextPressed()
    func apodViewDateValueChanged(date: Date)
}

protocol ApodViewLogic: UIView {
    var delegate: ApodViewDelegate? { get set }

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
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return datePicker
    }()

    private lazy var apodStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [mediaView, titleLabel, descriptionTitleLabel, descriptionTextView, datePicker]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(8, after: descriptionTitleLabel)
        stackView.setCustomSpacing(16, after: descriptionTextView)
        return stackView
    }()
    
    private lazy var apodButtonsView: ApodButtonsView = {
        let view = ApodButtonsView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(apodButtonsView)
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            apodStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            apodStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            apodStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            apodButtonsView.topAnchor.constraint(equalTo: apodStackView.bottomAnchor, constant: 16),
            apodButtonsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            apodButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            apodButtonsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    @objc private func changeDateButtonPressed() {
        delegate?.apodViewChangeDatePressed()
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        sender.preferredDatePickerStyle = .wheels
        sender.preferredDatePickerStyle = .automatic
        delegate?.apodViewDateValueChanged(date: sender.date)
    }
}

extension ApodView: ApodViewLogic {
    func setupView(viewModel: ApodViewModel) {
        mediaView.setup(url: viewModel.mediaURL, type: .image)
        titleLabel.text = viewModel.title
        descriptionTextView.text = viewModel.description
        datePicker.date = viewModel.date
        apodButtonsView.isHiddenNextButton = viewModel.isHiddenNextButton
    }
}

extension ApodView: ApodButtonsViewDelegate {
    func apodButtonsViewPreviousPressed() {
        delegate?.apodViewPreviousPressed()
    }
    
    func apodButtonsViewViewNextPressed() {
        delegate?.apodViewNextPressed()
    }
}
