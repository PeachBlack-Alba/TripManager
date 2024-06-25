//
//  ContactFormProtocols.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI


protocol ContactFormViewProtocol: AnyObject {
    var presenter: ContactFormPresenterProtocol? { get set }
    func showForm(_ form: ContactForm)
    func showValidationError(message: String)
    func showSubmissionSuccess()
    func showSubmissionError(message: String)
}

protocol ContactFormPresenterProtocol: AnyObject {
    var view: ContactFormViewProtocol? { get set }
    var interactor: ContactFormInteractorInputProtocol? { get set }
    var router: ContactFormRouterProtocol? { get set }

    func viewDidLoad()
    func submitForm(_ form: ContactForm)
}

protocol ContactFormInteractorInputProtocol: AnyObject {
    var presenter: ContactFormInteractorOutputProtocol? { get set }
    func submitForm(_ form: ContactForm)
}

protocol ContactFormInteractorOutputProtocol: AnyObject {
    func didSubmitContactForm()
    func didFailToSubmitContactForm(error: Error)
}

protocol ContactFormRouterProtocol: AnyObject {
    static func createContactFormModule(isPresented: Binding<Bool>) -> AnyView
}
