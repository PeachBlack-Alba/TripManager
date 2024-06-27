//
//  ContactFormView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI


import Combine


import SwiftUI
import Combine

struct ContactFormView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ContactFormViewModel
    @State private var showAlert = false

    var body: some View {
        VStack {
            // Add the form fields here
            Text("Contact Form")
                .font(.headline)
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Surname", text: $viewModel.surname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Phone", text: $viewModel.phone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Details", text: $viewModel.details)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            DatePicker("Date", selection: $viewModel.date)
                .padding()

            Button("Save") {
                viewModel.save()
                showAlert = true
            }
            .disabled(viewModel.saveDisabled)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Form Saved"),
                    message: Text("Your form has been saved successfully."),
                    dismissButton: .default(Text("OK")) {
                        isPresented = false
                    }
                )
            }
        }
        .padding()
    }
}
