////
////  ContactFormViewContainer.swift
////  TripManager
////
////  Created by Alba Torres Rodriguez on 24.06.24.
////
//
//import Foundation
//import SwiftUI
//
//
//struct ContactFormViewContainer: View {
//    @ObservedObject var viewModel: ContactFormViewModel
//    @Binding var isPresented: Bool
//
//    var body: some View {
//        ContactFormView(viewModel: viewModel, isPresented: $isPresented)
//    }
//}
//
//struct ContactFormViewContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = ContactFormViewModel(presenter: ContactFormPresenter())
//        return ContactFormViewContainer(viewModel: viewModel, isPresented: .constant(true))
//    }
//}
