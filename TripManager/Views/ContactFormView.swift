//
//  ContactFormView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI


struct ContactFormView: View {
    @ObservedObject var viewModel: ContactFormViewModel
    @Binding var isPresented: Bool

    var body: some View {
        Form {
            Section(header: Text("Contact Information")) {
                TextField("Name", text: $viewModel.form.name)
                TextField("Surname", text: $viewModel.form.surname)
                TextField("Email", text: $viewModel.form.email)
                TextField("Phone", text: $viewModel.form.phone)
            }

            Section(header: Text("Report Details")) {
                DatePicker("Date", selection: $viewModel.form.reportDate, displayedComponents: [.date, .hourAndMinute])
                TextEditor(text: $viewModel.form.description)
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                    .onChange(of: viewModel.form.description) { newValue in
                        if newValue.count > 200 {
                            viewModel.form.description = String(newValue.prefix(200))
                        }
                    }
            }

            Button(action: {
                print("Button pressed - Submitting form: \(viewModel.form)")
                viewModel.presenter?.submitForm(viewModel.form)
            }) {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
            }
        }
        .navigationBarTitle("Contact Form")
        .onAppear {
            viewModel.presenter?.viewDidLoad()
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
        .onChange(of: viewModel.formSubmitted) { submitted in
            if submitted {
                isPresented = false
            }
        }
    }
}
