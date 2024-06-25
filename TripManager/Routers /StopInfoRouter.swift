//
//  StopInfoRouter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//

import Foundation
import SwiftUI

class StopInfoRouter: StopInfoRouterProtocol {
    static func createModule(stopId: Int) -> AnyView {
        let presenter = StopInfoPresenter()
        let viewModel = StopInfoViewModel(presenter: presenter, stopId: stopId)
        let view = StopInfoView(viewModel: viewModel)

        let interactor: StopInfoInteractorInputProtocol = StopInfoInteractor()

        presenter.view = viewModel
        presenter.interactor = interactor
        presenter.router = StopInfoRouter()
        interactor.presenter = presenter

        return AnyView(view)
    }
}
