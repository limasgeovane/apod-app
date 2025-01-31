//
//  ApodRepository.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import Foundation

protocol ApodRepositoryLogic {
    func fetchApod(date: String, completion: @escaping (Result<Apod, Error>) -> Void)
}

struct ApodRepository: ApodRepositoryLogic {
    private let network: NetworkLogic
    
    init(network: NetworkLogic = Network()) {
        self.network = network
    }
    
    func fetchApod(date: String, completion: @escaping (Result<Apod, Error>) -> Void) {
        network.request(configuration: ApodRequestConfiguration(date: date), completion: completion)
    }
}
