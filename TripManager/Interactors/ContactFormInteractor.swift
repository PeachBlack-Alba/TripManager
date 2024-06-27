//
//  ContactFormInteractor.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import UIKit


class ContactFormInteractor: ContactFormInteractorInputProtocol {
    weak var presenter: ContactFormInteractorOutputProtocol?

    func submitForm(_ form: ContactForm) {
        do {
            print("Interactor: Attempting to save form \(form)")
            try LocalStorage.shared.saveForm(form)
            updateBadgeCount()
            presenter?.didSubmitContactForm()
        } catch {
            print("Interactor: Error saving form - \(error.localizedDescription)")
            presenter?.didFailToSubmitContactForm(error: error)
        }
    }

    private func updateBadgeCount() {
        do {
            let forms = try LocalStorage.shared.loadForms()
            print("Interactor: Loaded forms for badge count - \(forms.count)")
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber = forms.count
            }
        } catch {
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
    }
}
