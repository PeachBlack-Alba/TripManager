//
//  ContactFormPresenter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation


class ContactFormPresenter: ContactFormPresenterProtocol, ContactFormInteractorOutputProtocol {
    weak var view: ContactFormViewProtocol?
    var interactor: ContactFormInteractorInputProtocol?
    var router: ContactFormRouterProtocol?

    func viewDidLoad() {
        // Implement any additional setup if needed
    }

    func submitForm(_ form: ContactForm) {
        interactor?.submitForm(form)
    }

    func didSubmitContactForm() {
        // Handle successful form submission
    }

    func didFailToSubmitContactForm(error: Error) {
        // Handle form submission failure
    }
}
