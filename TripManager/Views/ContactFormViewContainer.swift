//
//  ContactFormViewContainer.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 24.06.24.
//

import Foundation
import SwiftUI

struct ContactFormViewContainer: View {
    @ObservedObject var viewModel: ContactFormViewModel

    var body: some View {
        ContactFormView(viewModel: viewModel)
    }
}

struct ContactFormViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ContactFormViewModel(presenter: ContactFormPresenter())
        return ContactFormViewContainer(viewModel: viewModel)
    }
}
