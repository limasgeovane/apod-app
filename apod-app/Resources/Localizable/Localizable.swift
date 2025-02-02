//
//  Localizable.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import Foundation

@propertyWrapper
struct Localizable {
    var wrappedValue: String {
        didSet {
            wrappedValue = NSLocalizedString(wrappedValue, comment: "")
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = NSLocalizedString(wrappedValue, comment: "")
    }
}

enum Strings {
    @Localizable static var apod = "apod"
    @Localizable static var favorites = "favorites"
    @Localizable static var nextApod = "nextApod"
    @Localizable static var previousApod = "previousApod"
    @Localizable static var description = "description"
    @Localizable static var loading = "loading"
}
