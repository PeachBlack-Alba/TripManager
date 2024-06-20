//
//  TripsListRouter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import UIKit

class TripListRouter: TripListRouterProtocol {
    static func createTripListModule() -> UIViewController {
        let view = TripListView()
        let presenter: TripListPresenterProtocol & TripListInteractorOutputProtocol = TripListPresenter()
        let interactor: TripListInteractorInputProtocol = TripListInteractor()
        let router: TripListRouterProtocol = TripListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}

