//
//  MockTripListPresenter.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
@testable import TripManager

class MockTripListPresenter: TripListPresenterProtocol, TripListInteractorOutputProtocol {
    var view: TripListViewProtocol?
    var interactor: TripListInteractorInputProtocol?
    var router: TripListRouterProtocol?
    var viewDidLoadCalled = false
    var didFetchTripsCalled = false
    var didFailToFetchTripsCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    func didFetchTrips(_ trips: [Trip]) {
        didFetchTripsCalled = true
    }

    func didFailToFetchTrips(error: Error) {
        didFailToFetchTripsCalled = true
    }
}
