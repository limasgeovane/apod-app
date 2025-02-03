//
//  ApodRepositoryTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import XCTest
@testable import apod_app

final class ApodRepositoryTests: XCTestCase {
    let networkSpy = NetworkSpy()
    lazy var sut = ApodRepository(network: networkSpy)
    
    func test_fetchApod_givenSuccess_shouldCompleteSuccess() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        networkSpy.stubbedRequestCompletionResult = successStubbed
        
        sut.fetchApod(date: "2025-02-02") { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, .fixture())
                XCTAssertEqual(self.networkSpy.requestCount, 1)
            case .failure:
                XCTFail("Should be a success")
            }
        }
    }
    
    func test_fetchApod_givenFailure_shouldCompleteErro() {
        let successStubbed: Result<Apod, Error> = .failure(NetworkError.anyError)
        networkSpy.stubbedRequestCompletionResult = successStubbed
        
        sut.fetchApod(date: "2025-02-02") { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as? NetworkError, NetworkError.anyError)
                XCTAssertEqual(self.networkSpy.requestCount, 1)
            case .success:
                XCTFail("Should be a error")
            }
        }
    }
}
