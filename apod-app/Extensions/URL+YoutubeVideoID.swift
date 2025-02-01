//
//  URL+YoutubeVideoID.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 01/02/25.
//

import Foundation

extension URL {
    var youtubeVideoID: String? {
        if self.host == "www.youtube.com" || self.host == "youtube.com" {
            if self.pathComponents.count > 1, self.pathComponents[1] == "embed" {
                return self.lastPathComponent.split(separator: "?").first?.description
            }
            
            if let queryItems = URLComponents(url: self, resolvingAgainstBaseURL: false)?.queryItems {
                return queryItems.first(where: { $0.name == "v" })?.value
            }
        }
        return nil
    }
}
