//
//  Date+IsEqual.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

extension Date {
    func isEqualTo(_ otherDate: Date) -> Bool {
        let calendar = Calendar.current
        
        let startOfDay1 = calendar.startOfDay(for: self)
        let startOfDay2 = calendar.startOfDay(for: otherDate)
        
        return startOfDay1 == startOfDay2
    }
}
