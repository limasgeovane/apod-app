//
//  DateProvider.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 03/02/25.
//

import Foundation

protocol DateProvider {
    func currentDate() -> Date
}
