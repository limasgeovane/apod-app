//
//  ApodRepositorySpy.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

@testable import apod_app

final class ApodRepositorySpy: ApodRepositoryLogic {
    private(set) var fetchApodCount = 0
    private(set) var fetchApodParameterDate: String?
    var stubbedFetchApodCompletionResult: Result<Apod, Error>?

    func fetchApod(date: String, completion: @escaping (Result<Apod, Error>) -> Void) {
        fetchApodCount += 1
        fetchApodParameterDate = date
        if let result = stubbedFetchApodCompletionResult {
            completion(result)
        }
    }
}
