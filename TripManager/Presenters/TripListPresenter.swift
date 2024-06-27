//
//  TripListPresenter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation

class TripListPresenter: TripListPresenterProtocol {
    weak var view: TripListViewProtocol?
    var interactor: TripListInteractorInputProtocol?
    var router: TripListRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchTrips()
        interactor?.fetchStopInfo()
    }

    func didSelectTrip(_ trip: Trip) {
        view?.showTripOnMap(trip)
    }

    func didSelectStop(_ stopId: Int) {
        print("didSelectStop called")
    }
}

extension TripListPresenter: TripListInteractorOutputProtocol {
    func didFetchTrips(_ trips: [Trip]) {
        view?.showTrips(trips)
    }

    func didFailToFetchTrips(error: Error) {
        print("didFailToFetchTrips Error")
    }
    func didFetchStopInfo(_ stopInfo: StopInfo) {
        view?.updateStopInfo(stopInfo)
        print("didFetchStopInfo called")
    }
}
