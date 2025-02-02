//
//  ApodView.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit
import Kingfisher

protocol ApodViewDelegate: AnyObject {
    func apodViewPreviousPressed()
    func apodViewNextPressed()
    func apodViewDateValueChanged(date: Date)
    func apodViewErrorActionPressed()
}

protocol ApodViewLogic: UIView {
    var delegate: ApodViewDelegate? { get set }

    func setupContent(viewModel: ApodViewModel)
    func changeState(state: ApodView.State)
}

class ApodView: UIView {
    enum State {
        case content
        case loading
        case error
    }
    
    private let mediaView = ApodMediaView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .title
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.description
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
    
    private let loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var errorView: ErrorView = {
        let view = ErrorViewFactory.makeApodError { [weak self] in
            self?.delegate?.apodViewErrorActionPressed()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate: ApodViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(apodStackView)
        addSubview(apodButtonsView)
        addSubview(loadingView)
        addSubview(errorView)
    }
    
    private func setupViewAttributes() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            apodStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            apodStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            apodStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            apodButtonsView.topAnchor.constraint(equalTo: apodStackView.bottomAnchor, constant: 16),
            apodButtonsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            apodButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            apodButtonsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            errorView.topAnchor.constraint(equalTo: topAnchor),
            errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        sender.preferredDatePickerStyle = .wheels
        sender.preferredDatePickerStyle = .automatic
        delegate?.apodViewDateValueChanged(date: sender.date)
    }
}

extension ApodView: ApodViewLogic {
    func setupContent(viewModel: ApodViewModel) {
        mediaView.setup(url: viewModel.mediaURL, type: viewModel.mediaType)
        titleLabel.text = viewModel.title
        descriptionTextView.text = viewModel.description
        datePicker.date = viewModel.date
        apodButtonsView.isHiddenNextButton = viewModel.isHiddenNextButton
    }
    
    func changeState(state: ApodView.State) {
        switch state {
        case .content:
            loadingView.isHidden = true
            errorView.isHidden = true
        case .loading:
            loadingView.isHidden = false
            errorView.isHidden = true
        case .error:
            loadingView.isHidden = true
            errorView.isHidden = false
        }
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
