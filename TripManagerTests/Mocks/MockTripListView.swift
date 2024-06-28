//
//  MockTripListView.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
@testable import TripManager

import Foundation
@testable import TripManager

class MockTripListView: TripListViewProtocol {
    var presenter: TripListPresenterProtocol?
    var showTripsCalled = false
    var showTripOnMapCalled = false
    var updateStopInfoCalled = false

    func showTrips(_ trips: [Trip]) {
        showTripsCalled = true
    }

    func showTripOnMap(_ trip: Trip) {
        showTripOnMapCalled = true
    }

    func updateStopInfo(_ stopInfo: StopInfo) {
        updateStopInfoCalled = true
    }
}

