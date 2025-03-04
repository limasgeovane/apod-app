//
//  ApodRequestConfigurationTests.swift
//  apod-app
//
//  Created by Geovane Lima dos Santos on 02/02/25.
//

import XCTest
@testable import apod_app

final class ApodConfigurationTests: XCTestCase {
    var sut = ApodRequestConfiguration(date: "2025-02-02")

    func test_path_shouldCorrectPath() {
        XCTAssertEqual(sut.path, "/planetary/apod")
    }
    
    func test_method_shouldBeGet() {
        XCTAssertEqual(sut.method, .get)
    }
    
    func test_parameters_shouldCorrectParameters() {
        XCTAssertEqual(sut.parameters["api_key"] as? String, "79fgd4R8Mecs5xjeMRRaMXhvYjTahGIrjmMPiwZD")
        XCTAssertEqual(sut.parameters["date"] as? String, "2025-02-02")
    }
    
    func test_baseURL_shouldBeSpotify() {
        XCTAssertEqual(sut.baseURL, .nasa)
    }
    
    func test_encoding_shouldBeDefault() {
        XCTAssertEqual(sut.enconding, .default)
    }
    
    func test_headers_shouldBeEmpty() {
        XCTAssertTrue(sut.hearders.isEmpty)
    }
}
