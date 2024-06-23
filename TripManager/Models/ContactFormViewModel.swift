//
//  ContactFormViewModel.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation

import Foundation

class ContactFormViewModel: ObservableObject {
    @Published var form: ContactForm

    var presenter: ContactFormPresenterProtocol?

    init(presenter: ContactFormPresenterProtocol, form: ContactForm = ContactForm(name: "", surname: "", email: "", phone: "", reportDate: Date(), description: "")) {
        self.presenter = presenter
        self.form = form
    }

    func showForm(_ form: ContactForm) {
        DispatchQueue.main.async {
            self.form = form
        }
    }
}
