//
//  StopInfoInteractor.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//

import Foundation


class StopInfoInteractor: StopInfoInteractorInputProtocol {
    weak var presenter: StopInfoInteractorOutputProtocol?

    func loadStopInfo(stopId: Int) {
        NetworkService.shared.fetchStopInfo { [weak self] result in
            switch result {
            case .success(let stops):
                if let stop = stops.first(where: { $0.tripId == stopId }) {
                    self?.presenter?.stopInfoFetched(stop)
                } else {
                    self?.presenter?.stopInfoFetchFailed(NSError(domain: "Stop not found", code: -1, userInfo: nil))
                }
            case .failure(let error):
                self?.presenter?.stopInfoFetchFailed(error)
            }
        }
    }
}
