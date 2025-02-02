//
//  UIFonts.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import UIKit

extension UIFont {
    static let appName: UIFont = {
        return UIFont(name: "FuturaCyrillicBold", size: 34) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    }()
    
    static let title: UIFont = {
        return UIFont(name: "Roboto-Bold", size: 24) ?? UIFont.systemFont(ofSize: 2, weight: .bold)
    }()
    
    static let primary: UIFont = {
        return UIFont(name: "Roboto-Medium", size: 18) ?? UIFont.systemFont(ofSize: 2, weight: .bold)
    }()
    
    static let secondary: UIFont = {
        return UIFont(name: "Roboto-Light", size: 16) ?? UIFont.systemFont(ofSize: 2, weight: .regular)
    }()
}
