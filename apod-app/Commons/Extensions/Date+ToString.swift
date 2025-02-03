//
//  Date+ToString.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

extension Date {
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
