//
//  ApodViewSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import UIKit

final class ApodViewSpy: UIView, ApodViewLogic {
    private(set) var delegateGetterCount = 0
    var stubbedDelegate: ApodViewDelegate?
    private(set) var delegateSetterCount = 0
    private(set) var invokedDelegate: ApodViewDelegate?
    
    var delegate: ApodViewDelegate? {
        get {
            delegateGetterCount += 1
            return stubbedDelegate
        }
        set {
            delegateSetterCount += 1
            invokedDelegate = newValue
        }
    }
    
    private(set) var setupContentCount = 0
    private(set) var setupContentParameterViewModel: ApodViewModel?
    
    func setupContent(viewModel: ApodViewModel) {
        setupContentCount += 1
        setupContentParameterViewModel = viewModel
    }
    
    private(set) var changeStateCount = 0
    private(set) var changeStateParameterState: ApodView.State?
    
    func changeState(state: ApodView.State) {
        changeStateCount += 1
        changeStateParameterState = state
    }
}
