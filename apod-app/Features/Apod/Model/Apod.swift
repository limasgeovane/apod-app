//
//  Apod.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import Foundation

struct Apod: Decodable, Equatable {
    let title: String
    let date: String
    let explanation: String
    let hdurl: URL?
    let url: URL
    let mediaType: MediaType
    
    enum MediaType: String, Decodable {
        case image = "image"
        case video = "video"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case date
        case explanation
        case hdurl
        case url
        case mediaType = "media_type"
    }
}
