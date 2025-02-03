//
//  DefaultDateProvider.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import Foundation

final class DefaultDateProvider: DateProvider {
    func currentDate() -> Date {
        return Date()
    }
}
