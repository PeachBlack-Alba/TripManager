//
//  TripsListRouter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import SwiftUI

class TripListRouter: TripListRouterProtocol {
    static func createTripListModule() -> AnyView {
        let view = TripListViewWrapper()
        let presenter: TripListPresenterProtocol & TripListInteractorOutputProtocol = TripListPresenter()
        let interactor: TripListInteractorInputProtocol = TripListInteractor()
        let router: TripListRouterProtocol = TripListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return AnyView(view.contentView)
    }
}
