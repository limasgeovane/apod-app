//
//  Network.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 31/01/25.
//

import Foundation

protocol NetworkLogic {
    func request<T: Decodable>(
        configuration: NetworkRequestConfigurator,
        completion: @escaping (Result<T, Error>) -> Void
    )
}

class Network: NetworkLogic {
    private let networkRequest: NetworkRequester
    private let networkDeserialization: NetworkDeserialization
    
    init(
        networkRequest: NetworkRequester = AlamofireNetworkRequest(),
        networkDeserialization: NetworkDeserialization = NetworkDeserialization()
    ) {
        self.networkRequest = networkRequest
        self.networkDeserialization = networkDeserialization
    }
    
    func request<T: Decodable>(
        configuration: NetworkRequestConfigurator,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        networkRequest.request(
            url: configuration.baseURL.rawValue + configuration.path,
            method: configuration.method,
            parameters: configuration.parameters,
            encoding: configuration.enconding,
            headers: configuration.hearders
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                do {
                    let decodedData = try networkDeserialization.decode(data: data) as T
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error as Error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
