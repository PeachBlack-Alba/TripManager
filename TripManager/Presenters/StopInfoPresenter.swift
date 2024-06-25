//
//  StopInfoPresenter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//

import Foundation

class StopInfoPresenter: StopInfoPresenterProtocol {
    weak var view: StopInfoViewProtocol?
    var interactor: StopInfoInteractorInputProtocol?
    var router: StopInfoRouterProtocol?

    func fetchStopInfo(stopId: Int) {
        interactor?.loadStopInfo(stopId: stopId)
    }
}

extension StopInfoPresenter: StopInfoInteractorOutputProtocol {
    func stopInfoFetched(_ stop: StopInfo) {
        view?.showStopInfo(stop)
    }

    func stopInfoFetchFailed(_ error: Error) {
        view?.showError(error.localizedDescription)
    }
}
