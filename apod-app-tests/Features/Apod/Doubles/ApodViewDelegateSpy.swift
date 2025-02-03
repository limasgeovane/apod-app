//
//  ApodViewDelegateSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app
import Foundation

final class ApodViewDelegateSpy: ApodViewDelegate {
    private(set) var apodViewPreviousPressedCount = 0

    func apodViewPreviousPressed() {
        apodViewPreviousPressedCount += 1
    }

    private(set) var apodViewNextPressedCount = 0

    func apodViewNextPressed() {
        apodViewNextPressedCount += 1
    }

    private(set) var apodViewDateValueChangedCount = 0
    private(set) var apodViewDateValueChangedParameterDate: Date?

    func apodViewDateValueChanged(date: Date) {
        apodViewDateValueChangedCount += 1
        apodViewDateValueChangedParameterDate = date
    }

    private(set) var apodViewErrorActionPressedCount = 0

    func apodViewErrorActionPressed() {
        apodViewErrorActionPressedCount += 1
    }
}
