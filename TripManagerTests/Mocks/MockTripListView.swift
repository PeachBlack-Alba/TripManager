//
//  MockTripListView.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
@testable import TripManager

class MockTripListView: TripListViewProtocol {
    var presenter: TripListPresenterProtocol?
    var showTripsCalled = false

    func showTrips(_ trips: [Trip]) {
        showTripsCalled = true
    }
}
