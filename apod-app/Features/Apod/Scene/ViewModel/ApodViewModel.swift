//
//  ApodViewModel.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 30/01/25.
//

import Foundation

struct ApodViewModel {
    var mediaURL: URL
    var mediaType: Apod.MediaType
    var title: String
    var description: String
    var date: Date
    var isHiddenNextButton: Bool
    var isFavorite: Bool
}
