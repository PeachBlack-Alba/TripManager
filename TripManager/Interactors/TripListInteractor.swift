//
//  TripListInteractor.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation

class TripListInteractor: TripListInteractorInputProtocol {
    weak var presenter: TripListInteractorOutputProtocol?

    func fetchTrips() {
        NetworkService.shared.fetchTrips { [weak self] result in
            switch result {
            case .success(let trips):
                print("Interactor received trips: \(trips.count)")
                self?.presenter?.didFetchTrips(trips)
            case .failure(let error):
                print("Interactor error: \(error)")
                self?.presenter?.didFailToFetchTrips(error: error)
            }
        }
    }
}
