////
////  ContactFormPresenter.swift
////  TripManager
////
////  Created by Alba Torres Rodriguez on 23.06.24.
////
//
//import Foundation
//
//class ContactFormPresenter: ContactFormPresenterProtocol, ContactFormInteractorOutputProtocol {
//    weak var view: ContactFormViewProtocol?
//    var interactor: ContactFormInteractorInputProtocol?
//    var router: ContactFormRouterProtocol?
//
//    func viewDidLoad() {
//    }
//
//    func submitForm(_ form: ContactForm) {
//        print("Presenter: Submitting form \(form)")
//        guard !form.name.isEmpty,
//              !form.surname.isEmpty,
//              !form.email.isEmpty,
//              !form.description.isEmpty else {
//            print("Presenter: Validation failed")
//            view?.showValidationError(message: "Please fill in all fields except phone.")
//            return
//        }
//
//        interactor?.submitForm(form)
//    }
//
//    func didSubmitContactForm() {
//        print("Presenter: Form submitted successfully")
//        view?.showSubmissionSuccess()
//    }
//
//    func didFailToSubmitContactForm(error: Error) {
//        print("Presenter: Submission failed with error \(error.localizedDescription)")
//        view?.showSubmissionError(message: error.localizedDescription)
//    }
//}
