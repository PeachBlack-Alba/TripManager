//
//  NetworkServiceTests.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 27.06.24.
//

import Foundation
import XCTest
@testable import TripManager

class NetworkServiceTests: XCTestCase {
    var networkService: NetworkService!

    override func setUp() {
        super.setUp()
        networkService = NetworkService()
    }

    override func tearDown() {
        networkService = nil
        super.tearDown()
    }

    func testFetchTrips() {
        let expectation = XCTestExpectation(description: "Fetch trips")

        networkService.fetchTrips { result in
            switch result {
            case .success(let trips):
                XCTAssertGreaterThan(trips.count, 0)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchStopInfo() {
        let expectation = XCTestExpectation(description: "Fetch stop info")

        networkService.fetchStopInfo { result in
            switch result {
            case .success(let stopInfo):
                XCTAssertNotNil(stopInfo)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
