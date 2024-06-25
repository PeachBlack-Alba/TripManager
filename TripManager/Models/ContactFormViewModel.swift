//
//  ContactFormViewModel.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//
import Foundation

class ContactFormViewModel: ObservableObject, ContactFormViewProtocol {
    @Published var form: ContactForm
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var formSubmitted = false

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

    func showValidationError(message: String) {
        DispatchQueue.main.async {
            self.alertMessage = message
            self.showAlert = true
        }
    }

    func showSubmissionSuccess() {
        DispatchQueue.main.async {
            self.formSubmitted = true
        }
    }

    func showSubmissionError(message: String) {
        DispatchQueue.main.async {
            self.alertMessage = message
            self.showAlert = true
        }
    }
}
