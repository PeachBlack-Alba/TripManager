//
//  ContactFormViewModel.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//
import Foundation
import UIKit
import Combine

final class ContactFormViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()
    let objectWillChange = PassthroughSubject<Void, Never>()
    var onSave: () -> Void

    @Published var name: String = "" {
        didSet { validateForm() }
    }
    @Published var surname: String = "" {
        didSet { validateForm() }
    }
    @Published var email: String = "" {
        didSet { validateForm() }
    }
    @Published var phone: String = "" {
        didSet { validateForm() }
    }
    @Published var details: String = "" {
        didSet { validateForm() }
    }
    @Published var date: Date = Date()
    @Published var saveDisabled: Bool = true

    init(onSave: @escaping () -> Void) {
        self.onSave = onSave
    }

    func save() {
        let report = Report(name: name, surname: surname, email: email, phone: phone.isEmpty ? nil : phone, details: details, date: date)
        do {
            print("Saving report: \(report)")
            try LocalStorage.shared.saveForm(report)
            LocalStorage.shared.printSavedReports()
            updateBadge()
            onSave()
        } catch {
            print("Error saving report: \(error)")
        }
    }

    private func updateBadge() {
        do {
            let reports = try LocalStorage.shared.loadForms()
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber = reports.count
                print("Badge number updated to: \(reports.count)")
            }
        } catch {
            print("Error updating badge: \(error)")
        }
    }

    private func validateForm() {
        saveDisabled = name.isEmpty || surname.isEmpty || email.isEmpty || details.isEmpty || details.count > 200
        objectWillChange.send()
    }
}
