//
//  ContactFormRouter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI

class ContactFormRouter: ContactFormRouterProtocol {
    static func createContactFormModule(isPresented: Binding<Bool>) -> AnyView {
        let presenter = ContactFormPresenter()
        let viewModel = ContactFormViewModel(presenter: presenter)
        let viewWrapper = ContactFormViewWrapper(viewModel: viewModel, isPresented: isPresented)

        let interactor = ContactFormInteractor()
        presenter.view = viewWrapper
        presenter.interactor = interactor
        presenter.router = ContactFormRouter()
        interactor.presenter = presenter

        return AnyView(ContactFormViewContainer(viewModel: viewModel, isPresented: isPresented))
    }
}
