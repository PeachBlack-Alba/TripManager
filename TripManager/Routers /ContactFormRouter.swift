//
//  ContactFormRouter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI


class ContactFormRouter: ContactFormRouterProtocol {
    static func createContactFormModule() -> AnyView {
        let viewModel = ContactFormViewModel(presenter: ContactFormPresenter())
        let viewWrapper = ContactFormViewWrapper(viewModel: viewModel)
        let presenter: ContactFormPresenterProtocol & ContactFormInteractorOutputProtocol = ContactFormPresenter()
        let interactor: ContactFormInteractorInputProtocol = ContactFormInteractor()
        let router: ContactFormRouterProtocol = ContactFormRouter()

        viewWrapper.presenter = presenter
        presenter.view = viewWrapper
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return AnyView(ContactFormViewContainer(viewModel: viewModel))
    }
}
