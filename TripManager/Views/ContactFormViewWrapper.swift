////
////  ContactFormViewWrapper.swift
////  TripManager
////
////  Created by Alba Torres Rodriguez on 23.06.24.
////
//
//import Foundation
//import SwiftUI
//
//class ContactFormViewWrapper: ObservableObject, ContactFormViewProtocol {
//    @ObservedObject var viewModel: ContactFormViewModel
//    @Binding var isPresented: Bool
//
//    var presenter: ContactFormPresenterProtocol? {
//        get { viewModel.presenter }
//        set { viewModel.presenter = newValue }
//    }
//
//    init(viewModel: ContactFormViewModel, isPresented: Binding<Bool>) {
//        self.viewModel = viewModel
//        self._isPresented = isPresented
//    }
//
//    func showForm(_ form: ContactForm) {
//        viewModel.showForm(form)
//    }
//
//    func showValidationError(message: String) {
//        DispatchQueue.main.async {
//            self.viewModel.showValidationError(message: message)
//        }
//    }
//
//    func showSubmissionSuccess() {
//        DispatchQueue.main.async {
//            self.isPresented = false
//        }
//    }
//
//    func showSubmissionError(message: String) {
//        DispatchQueue.main.async {
//            self.viewModel.showSubmissionError(message: message)
//        }
//    }
//}
