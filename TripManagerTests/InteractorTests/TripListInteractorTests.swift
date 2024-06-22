//
//  TripListInteractorTests.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import XCTest
@testable import TripManager

class TripListInteractorTests: XCTestCase {
    var interactor: TripListInteractor!
    var mockPresenter: MockTripListPresenter!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockPresenter = MockTripListPresenter()
        mockNetworkService = MockNetworkService()
        interactor = TripListInteractor(networkService: mockNetworkService)
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchTripsSuccess() {
        let trips = [Trip(driverName: "John Doe", startTime: "2022-01-01T00:00:00.000Z", endTime: "2022-01-01T01:00:00.000Z", status: "ongoing", description: "Test Trip", route: "test_route", origin: Location(address: "Test Address", point: Point(latitude: 0.0, longitude: 0.0)), destination: Location(address: "Test Address", point: Point(latitude: 0.0, longitude: 0.0)), stops: [])]
        mockNetworkService.fetchTripsResult = .success(trips)

        interactor.fetchTrips()
        XCTAssertTrue(mockPresenter.didFetchTripsCalled, "Expected didFetchTrips to be called")
    }

    func testFetchTripsFailure() {
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Test Error"])
        mockNetworkService.fetchTripsResult = .failure(error)

        interactor.fetchTrips()
        XCTAssertTrue(mockPresenter.didFailToFetchTripsCalled, "Expected didFailToFetchTrips to be called")
    }
}
