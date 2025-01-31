//
//  ApodRequestConfiguration.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

struct ApodRequestConfiguration: NetworkRequestConfigurator, Equatable {
    private let date: String
    
    init(date: String) {
        self.date = date
    }
    
    var path: String {
        "/planetary/apod"
    }
    
    var parameters: [String: Any] {
        [
            "api_key": "79fgd4R8Mecs5xjeMRRaMXhvYjTahGIrjmMPiwZD",
            "date": date,
        ]
    }
}
