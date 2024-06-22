//
//  TripListPresenterTests.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import XCTest
@testable import TripManager

class TripListPresenterTests: XCTestCase {
    var presenter: TripListPresenter!
    var mockView: MockTripListView!
    var mockInteractor: MockTripListInteractor!
    var mockRouter: MockTripListRouter!

    override func setUp() {
        super.setUp()
        presenter = TripListPresenter()
        mockView = MockTripListView()
        mockInteractor = MockTripListInteractor()
        mockRouter = MockTripListRouter()

        presenter.view = mockView
        presenter.interactor = mockInteractor
        presenter.router = mockRouter
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func testViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(mockInteractor.fetchTripsCalled, "Expected fetchTrips to be called")
    }

    func testDidFetchTrips() {
        let trips = [Trip(driverName: "John Doe", startTime: "2022-01-01T00:00:00.000Z", endTime: "2022-01-01T01:00:00.000Z", status: "ongoing", description: "Test Trip", route: "test_route", origin: Location(address: "Test Address", point: Point(latitude: 0.0, longitude: 0.0)), destination: Location(address: "Test Address", point: Point(latitude: 0.0, longitude: 0.0)), stops: [])]
        presenter.didFetchTrips(trips)
        XCTAssertTrue(mockView.showTripsCalled, "Expected showTrips to be called")
    }
}
