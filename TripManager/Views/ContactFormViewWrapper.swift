//
//  ContactFormViewWrapper.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI


class ContactFormViewWrapper: ObservableObject, ContactFormViewProtocol {
    @ObservedObject var viewModel: ContactFormViewModel

    var presenter: ContactFormPresenterProtocol? {
        get { viewModel.presenter }
        set { viewModel.presenter = newValue }
    }

    init(viewModel: ContactFormViewModel) {
        self.viewModel = viewModel
    }

    func showForm(_ form: ContactForm) {
        viewModel.showForm(form)
    }
}
