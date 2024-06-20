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
    }
}

extension TripListPresenter: TripListInteractorOutputProtocol {
    func didFetchTrips(_ trips: [Trip]) {
        view?.showTrips(trips)
    }

    func didFailToFetchTrips(error: Error) {
        // TODO: Handle error
    }
}
