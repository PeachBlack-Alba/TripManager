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
                self?.presenter?.didFetchTrips(trips)
            case .failure(let error):
                self?.presenter?.didFailToFetchTrips(error: error)
            }
        }
    }
}

