//
//  NetworkSpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class NetworkSpy: NetworkLogic {
    private(set) var requestCount = 0
    private(set) var requestParameterConfiguration: NetworkRequestConfigurator?
    var stubbedRequestCompletionResult: Any?
    
    func request<T: Decodable>(
        configuration: NetworkRequestConfigurator,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        requestCount += 1
        requestParameterConfiguration = configuration
        if let result = stubbedRequestCompletionResult as? Result<T, Error> {
            completion(result)
        }
    }
}
