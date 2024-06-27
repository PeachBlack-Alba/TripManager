//
//  ContactFormRouter.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI



class ContactFormRouter {
    static func createContactFormModule(isPresented: Binding<Bool>, onSave: @escaping () -> Void) -> some View {
        let viewModel = ContactFormViewModel(onSave: onSave)
        let view = ContactFormView(isPresented: isPresented, viewModel: viewModel)
        return NavigationView {
            view
                .navigationBarItems(leading: Button(action: {
                    isPresented.wrappedValue = false
                }) {
                    Text("Close")
                })
        }
    }
}
