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
    var presenter: MockPresenter!
    var mockNetworkService: CustomMockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = CustomMockNetworkService()
        interactor = TripListInteractor(networkService: mockNetworkService)
        presenter = MockPresenter()
        interactor.presenter = presenter
    }

    override func tearDown() {
        interactor = nil
        presenter = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchTrips() {
        interactor.fetchTrips()
        XCTAssertTrue(presenter.didFetchTripsCalled)
    }

    func testFetchStopInfo() {
        interactor.fetchStopInfo()
        XCTAssertTrue(presenter.didFetchStopInfoCalled)
    }
}

class CustomMockNetworkService: NetworkService {
    override func fetchTrips(completion: @escaping (Result<[Trip], Error>) -> Void) {
        let trip = Trip(
            id: nil,
            driverName: "Test Driver",
            startTime: "Start Time",
            endTime: "End Time",
            status: "",
            description: "Test Trip",
            route: "",
            origin: Location(address: "Start", point: Point(latitude: 41.0, longitude: 2.0)),
            destination: Location(address: "End", point: Point(latitude: 41.1, longitude: 2.1)),
            stops: []
        )
        completion(.success([trip]))
    }

    override func fetchStopInfo(completion: @escaping (Result<StopInfo, Error>) -> Void) {
        let stopInfo = StopInfo(
            id: UUID(),
            price: 10.0,
            address: "Stop Address",
            tripId: 1,
            paid: true,
            stopTime: "Stop Time",
            userName: "User",
            point: StopPoint(latitude: 41.0, longitude: 2.0)
        )
        completion(.success(stopInfo))
    }
}

class MockPresenter: TripListInteractorOutputProtocol {
    var didFetchTripsCalled = false
    var didFetchStopInfoCalled = false

    func didFetchTrips(_ trips: [Trip]) {
        didFetchTripsCalled = true
    }

    func didFailToFetchTrips(error: Error) {}

    func didFetchStopInfo(_ stopInfo: StopInfo) {
        didFetchStopInfoCalled = true
    }
}
