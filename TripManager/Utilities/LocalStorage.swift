//
//  LocalStorage.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation

import Foundation

class LocalStorage {
    static let shared = LocalStorage()
    private let formsKey = "savedForms"

//    func clearOldData() {
//        UserDefaults.standard.removeObject(forKey: formsKey)
//    }

    func saveForm(_ form: Report) throws {
        var forms = try loadForms()
        forms.append(form)
        let data = try JSONEncoder().encode(forms)
        UserDefaults.standard.set(data, forKey: formsKey)
    }

    func loadForms() throws -> [Report] {
        guard let data = UserDefaults.standard.data(forKey: formsKey) else {
            return []
        }
        return try JSONDecoder().decode([Report].self, from: data)
    }
    func printSavedReports() {
            do {
                let reports = try loadForms()
                print("Saved reports: \(reports)")
            } catch {
                print("Error loading reports: \(error)")
            }
        }
}
