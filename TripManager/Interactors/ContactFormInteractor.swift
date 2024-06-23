//
//  ContactFormInteractor.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import UIKit

import Foundation
import UIKit

class ContactFormInteractor: ContactFormInteractorInputProtocol {
    weak var presenter: ContactFormInteractorOutputProtocol?

    func submitForm(_ form: ContactForm) {
        do {
            try LocalStorage.shared.saveForm(form)
            presenter?.didSubmitContactForm()
        } catch {
            presenter?.didFailToSubmitContactForm(error: error)
        }
    }
}
