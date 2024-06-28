//
//  MockTripListInteractor.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
@testable import TripManager


class MockTripListInteractor: TripListInteractorInputProtocol {
    var presenter: TripListInteractorOutputProtocol?
    var fetchTripsCalled = false
    var fetchStopInfoCalled = false

    func fetchTrips() {
        fetchTripsCalled = true
    }

    func fetchStopInfo() {
        fetchStopInfoCalled = true
    }
}
