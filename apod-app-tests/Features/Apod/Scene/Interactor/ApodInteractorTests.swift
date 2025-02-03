//
//  ApodInteractorTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import XCTest
@testable import apod_app

final class ApodInteractorTests: XCTestCase {
    let repositorySpy = ApodRepositorySpy()
    let favoriteApodRepository = FavoritesApodRepositorySpy()
    let presenterSpy = ApodPresenterSpy()
    
    lazy var sut = ApodInteractor(
        repository: repositorySpy,
        favoriteApodRepository: favoriteApodRepository,
        presenter: presenterSpy,
        dateProvider: DefaultDateProviderSpy()
    )
    
    func test_requestApod_givenSuccess_shouldResponseApodOfTheDay() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        
        sut.requestApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-02")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseApodCount, 1)
        XCTAssertEqual(presenterSpy.responseApodParameterApod, .fixture())
    }
    
    func test_requestApod_givenFailure_shouldResponseError() {
        let failureStubbed: Result<Apod, Error> = .failure(NetworkError.anyError)
        repositorySpy.stubbedFetchApodCompletionResult = failureStubbed
        
        sut.requestApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-02")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseErrorCount, 1)
    }
    
    func test_requestApod_givenSpecificDate_givenSuccess_shouldResponseApod() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        
        sut.requestApod(date: "2024-06-17".toDate)
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2024-06-17")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseApodCount, 1)
        XCTAssertEqual(presenterSpy.responseApodParameterApod, .fixture())
    }
    
    func test_requestApod_givenSpecificDate_givenFailure_shouldResponseError() {
        let failureStubbed: Result<Apod, Error> = .failure(NetworkError.anyError)
        repositorySpy.stubbedFetchApodCompletionResult = failureStubbed
        
        sut.requestApod(date: "2024-06-17".toDate)
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2024-06-17")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseErrorCount, 1)
    }

    func test_requestYesterdaysApod_givenSuccess_shouldResponseYesterdaysApod() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        
        sut.requestYesterdaysApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-01")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseApodCount, 1)
        XCTAssertEqual(presenterSpy.responseApodParameterApod, .fixture())
    }
    
    func test_requestYesterdaysApod_givenFailure_shouldResponseError() {
        let failureStubbed: Result<Apod, Error> = .failure(NetworkError.anyError)
        repositorySpy.stubbedFetchApodCompletionResult = failureStubbed

        sut.requestYesterdaysApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-01")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseErrorCount, 1)
    }
    
    func test_requestFavoriteApod_shouldFavoriteApod() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        sut.requestApod()
        
        sut.requestFavoriteApod()
        
        XCTAssertEqual(favoriteApodRepository.favoriteCount, 1)
        XCTAssertEqual(favoriteApodRepository.favoriteParameterFavoriteApod, .fixture())
    }
    
    func test_requestUnfavoriteApod_shouldUnfavoriteApod() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        sut.requestApod()
        
        sut.requestUnfavoriteApod()
        
        XCTAssertEqual(favoriteApodRepository.unfavoriteCount, 1)
        XCTAssertEqual(favoriteApodRepository.unfavoriteParameterFavoriteApod, .fixture())
    }
    
    func test_requestPreviousApod_givenSuccess_shouldResponsePreviousApod() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        
        sut.requestPreviousApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-01")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseApodCount, 1)
        XCTAssertEqual(presenterSpy.responseApodParameterApod, .fixture())
    }
    
    func test_requestPreviousApod_givenFailure_shouldResponseError() {
        let failureStubbed: Result<Apod, Error> = .failure(NetworkError.anyError)
        repositorySpy.stubbedFetchApodCompletionResult = failureStubbed
        
        sut.requestPreviousApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-01")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseErrorCount, 1)
    }
    
    func test_requestNextApod_givenSuccess_shouldResponseNextApod() {
        let successStubbed: Result<Apod, Error> = .success(.fixture())
        repositorySpy.stubbedFetchApodCompletionResult = successStubbed
        
        sut.requestNextApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-03")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseApodCount, 1)
        XCTAssertEqual(presenterSpy.responseApodParameterApod, .fixture())
    }
    
    func test_requestNextApod_givenFailure_shouldResponseError() {
        let failureStubbed: Result<Apod, Error> = .failure(NetworkError.anyError)
        repositorySpy.stubbedFetchApodCompletionResult = failureStubbed
        
        sut.requestNextApod()
        
        XCTAssertEqual(repositorySpy.fetchApodCount, 1)
        XCTAssertEqual(repositorySpy.fetchApodParameterDate, "2025-02-03")
        XCTAssertEqual(presenterSpy.responseLoadingCount, 1)
        XCTAssertEqual(presenterSpy.responseErrorCount, 1)
    }
}
